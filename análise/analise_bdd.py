"""
Pipeline de análise dos dados de avaliação humana de cenários
BDD/Gherkin gerados por IA generativa (GPT-5.5 e Gemini 3.1 Pro).
"""

import os
import numpy as np
import pandas as pd
import pingouin as pg
from scipy import stats
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import seaborn as sns

# ---------------------------------------------------------------------------
# CONFIGURAÇÃO
# ---------------------------------------------------------------------------
CSV_PATH = "respostas_consolidadas_tcc.csv"
OUT_DIR = "resultados"

CRITERIOS = [
    "clareza",
    "completude",
    "objetividade",
    "separacao_cenarios",
    "aderencia_historia_criterios",
    "fidelidade_artefatos_entrada",
]
NOMES_CRITERIOS = {
    "clareza": "Clareza",
    "completude": "Completude",
    "objetividade": "Objetividade",
    "separacao_cenarios": "Separação dos cenários",
    "aderencia_historia_criterios": "Aderência à história e aos critérios",
    "fidelidade_artefatos_entrada": "Fidelidade aos artefatos de entrada",
}

sns.set_theme(style="whitegrid", font_scale=0.9)

# ---------------------------------------------------------------------------
# ETAPA 0 — Carregamento e checagem de consistência dos dados
# ---------------------------------------------------------------------------
def carregar_dados(caminho=CSV_PATH):
    """Carrega o CSV, valida a escala 1-5 e cria o índice composto de qualidade
    (média simples dos 6 critérios por avaliação)."""
    df = pd.read_csv(caminho)
    for c in CRITERIOS:
        assert df[c].between(1, 5).all(), f"Coluna {c} tem valores fora da escala 1-5"
    df["qualidade_geral"] = df[CRITERIOS].mean(axis=1)
    return df


def checar_desenho_experimental(df):
    """Confirma que o dado coletado corresponde ao desenho planejado (Seção 5.8
    do TCC): 6 avaliações por conjunto, 4 blocos por participante, 3 com experiência de mais de 2 anos +
    3 com experiência entre 1 e 2 anos."""
    problemas = []
    if not (df.groupby("historia_conjunto")["id_resposta"].nunique() == 6).all():
        problemas.append("Nem todo historia_conjunto tem exatamente 6 avaliações.")
    if not (df.groupby("id_resposta")["bloco_no_formulario"].nunique() == 4).all():
        problemas.append("Nem todo participante respondeu exatamente 4 blocos.")
    bal = pd.crosstab(df["historia_conjunto"], df["grupo_experiencia"])
    if not (bal == 3).all().all():
        problemas.append("Balanceamento de experiência por conjunto diferente de 3/3.")
    return problemas if problemas else ["OK — desenho consistente com o planejado."]


# ---------------------------------------------------------------------------
# ETAPA 1 — Estatística descritiva, índice composto e alfa de Cronbach
# (QP1, QP2, pergunta de pesquisa geral)
# ---------------------------------------------------------------------------
def cronbach_alpha(itens_df):
    itens_df = itens_df.dropna()

    alpha, intervalo_confianca = pg.cronbach_alpha(data=itens_df)

    return alpha, intervalo_confianca


def estatisticas_descritivas(df, out_dir=OUT_DIR):
    """Média, desvio-padrão e mediana por critério — geral, por fonte de
    geração e por grupo de experiência — mais a proporção de notas altas
    (>=4), uma leitura direta e barata da pergunta 'a qualidade é suficiente?'."""
    colunas = CRITERIOS + ["qualidade_geral"]

    geral = df[colunas].describe().T[["mean", "std", "50%"]].round(2)
    geral.to_csv(f"{out_dir}/descritivas_geral.csv")

    por_modelo = df.groupby("modelo_fonte_controle_interno")[colunas].agg(["mean", "std"]).round(2)
    por_modelo.to_csv(f"{out_dir}/descritivas_por_modelo.csv")

    por_experiencia = df.groupby("grupo_experiencia")[colunas].agg(["mean", "std"]).round(2)
    por_experiencia.to_csv(f"{out_dir}/descritivas_por_experiencia.csv")

    prop_boas = (df[CRITERIOS] >= 4).mean().round(3)
    prop_boas.to_csv(f"{out_dir}/proporcao_notas_maior_igual_4.csv")

    return {"geral": geral, "por_modelo": por_modelo, "por_experiencia": por_experiencia,
            "prop_notas_boas": prop_boas}


# ---------------------------------------------------------------------------
# ETAPA 2 — Visualização (um único gráfico)
# ---------------------------------------------------------------------------
def gerar_visualizacao(df, out_dir=OUT_DIR):
    """Um boxplot (critério x fonte de geração). Suficiente para ilustrar o
    achado numa apresentação/defesa sem precisar justificar múltiplos tipos
    de gráfico."""
    df_long = df.melt(id_vars="modelo_fonte_controle_interno", value_vars=CRITERIOS,
                       var_name="criterio", value_name="nota")
    df_long["criterio"] = df_long["criterio"].map(NOMES_CRITERIOS)

    fig, ax = plt.subplots(figsize=(9, 4.8))
    sns.boxplot(data=df_long, x="criterio", y="nota", hue="modelo_fonte_controle_interno", ax=ax)
    plt.setp(ax.get_xticklabels(), rotation=25, ha="right")
    ax.set_ylim(0.5, 5.5)
    ax.set_xlabel("")
    ax.legend(title="Fonte de geração")
    plt.tight_layout()
    plt.savefig(f"{out_dir}/fig1_boxplot_criterios_modelo.png", dpi=150)
    plt.close(fig)


# ---------------------------------------------------------------------------
# ETAPA 3 — Comparação entre fontes de geração (QP1, QP2, pergunta geral)
# ---------------------------------------------------------------------------
def comparar_modelos(df, out_dir=OUT_DIR):
    """Mann-Whitney U comparando GPT-5.5 x Gemini 3.1 Pro, aplicado apenas ao
    índice composto 'qualidade_geral' — de propósito só UM teste, não um por
    critério, para não precisar de correção de comparações múltiplas.
    Mann-Whitney (não teste t) porque a nota é ordinal (Likert 1-5), não
    intervalar, e o grupo é pequeno (24 avaliações por fonte)."""
    a = df.loc[df["modelo_fonte_controle_interno"] == "GPT-5.5", "qualidade_geral"]
    b = df.loc[df["modelo_fonte_controle_interno"] == "Gemini 3.1 Pro", "qualidade_geral"]
    u, p = stats.mannwhitneyu(a, b, alternative="two-sided")
    resultado = pd.DataFrame([{
        "comparacao": "GPT-5.5 vs Gemini 3.1 Pro (qualidade_geral)",
        "media_GPT-5.5": round(a.mean(), 2), "media_Gemini_3.1_Pro": round(b.mean(), 2),
        "U": u, "p_valor": round(p, 4),
    }])
    resultado.to_csv(f"{out_dir}/etapa3_comparacao_modelos.csv", index=False)
    return resultado


# ---------------------------------------------------------------------------
# ETAPA 4 — Comparação entre grupos de experiência (QP4, exploratório)
# ---------------------------------------------------------------------------
def comparar_experiencia(df, out_dir=OUT_DIR):
    """Mesmo teste da Etapa 3, agora comparando avaliadores Senior x Junior.
    QP4 pede essa comparação explicitamente, em caráter exploratório."""
    a = df.loc[df["grupo_experiencia"] == "Senior", "qualidade_geral"]
    b = df.loc[df["grupo_experiencia"] == "Junior", "qualidade_geral"]
    u, p = stats.mannwhitneyu(a, b, alternative="two-sided")
    resultado = pd.DataFrame([{
        "comparacao": "Senior vs Junior (qualidade_geral)",
        "media_Senior": round(a.mean(), 2), "media_Junior": round(b.mean(), 2),
        "U": u, "p_valor": round(p, 4),
    }])
    resultado.to_csv(f"{out_dir}/etapa4_comparacao_experiencia.csv", index=False)
    return resultado


# ---------------------------------------------------------------------------
# ETAPA 5 — Leitura qualitativa dos comentários (QP2, pergunta geral)
# ---------------------------------------------------------------------------
def exportar_comentarios(df, out_dir=OUT_DIR):
    """Não há análise automática aqui de propósito: com só 20 comentários no
    total, ler é mais rápido e mais confiável que qualquer classificador.
    Esta função só organiza a leitura, ordenando do pior para o melhor
    'qualidade_geral' — os comentários mais explicativos tendem a acompanhar
    as notas mais baixas."""
    bloco = (df.loc[df["comentario_bloco"].notna(),
                    ["historia_conjunto", "modelo_fonte_controle_interno", "qualidade_geral", "comentario_bloco"]]
             .sort_values("qualidade_geral"))
    bloco.to_csv(f"{out_dir}/etapa5_comentarios_por_bloco.csv", index=False)

    geral = (df.drop_duplicates("id_resposta")
             .loc[lambda d: d["comentario_geral_formulario"].notna(),
                  ["id_resposta", "grupo_experiencia", "comentario_geral_formulario"]])
    geral.to_csv(f"{out_dir}/etapa5_comentarios_gerais.csv", index=False)

    return bloco, geral


# ---------------------------------------------------------------------------
# MAIN
# ---------------------------------------------------------------------------
def main():
    os.makedirs(OUT_DIR, exist_ok=True)

    print(">> Etapa 0: carregando e checando os dados...")
    df = carregar_dados()
    for msg in checar_desenho_experimental(df):
        print("   -", msg)
    print(f"   {df.shape[0]} avaliações | {df['id_resposta'].nunique()} participantes | "
          f"{df['historia_conjunto'].nunique()} conjuntos avaliados")
  
    print("\n>> Etapa 1: estatística descritiva + índice composto + alfa de Cronbach...")
    alpha, intervalo_confianca = cronbach_alpha(df[CRITERIOS])
    print(f"Alfa de Cronbach: {alpha:.3f}")
    print(f"Intervalo de confiança de 95%: " f"[{intervalo_confianca[0]:.3f}, {intervalo_confianca[1]:.3f}]")
    
    estatisticas_descritivas(df)
    print("   Qualidade geral por modelo:",
          df.groupby("modelo_fonte_controle_interno")["qualidade_geral"].mean().round(2).to_dict())
    print("   Qualidade geral por experiência:",
          df.groupby("grupo_experiencia")["qualidade_geral"].mean().round(2).to_dict())

    print("\n>> Etapa 2: gerando o boxplot (fig1)...")
    gerar_visualizacao(df)

    print("\n>> Etapa 3: comparação entre modelos (Mann-Whitney U, só no índice composto)...")
    res_modelo = comparar_modelos(df)
    print(res_modelo.to_string(index=False))

    print("\n>> Etapa 4: comparação entre grupos de experiência (Mann-Whitney U)...")
    res_exp = comparar_experiencia(df)
    print(res_exp.to_string(index=False))

    print("\n>> Etapa 5: organizando comentários para leitura manual...")
    bloco, geral = exportar_comentarios(df)
    print(f"   {len(bloco)} comentários de bloco e {len(geral)} comentários gerais "
          f"exportados para leitura (ordenados do pior para o melhor).")

    print(f"\n=== Concluído. Resultados salvos em ./{OUT_DIR}/ ===")


if __name__ == "__main__":
    main()
