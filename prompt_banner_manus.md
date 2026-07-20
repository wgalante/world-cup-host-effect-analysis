# Prompt para o Manus — banner do projeto (versão final, 3 perguntas)

O projeto mudou de 4 para 3 perguntas (a de naturalização foi descartada — não passou
na validação). O banner também muda de 5 para 4 painéis: 3 perguntas + 1 painel de
stack/validação. Cole isso no Manus junto com a imagem mais recente como referência de estilo:

```
Recrie este banner de portfólio de dados mantendo EXATAMENTE o mesmo estilo visual,
mas com o conteúdo e o número de painéis abaixo (4 painéis, não 5 — redistribua a
largura igualmente entre eles).

ESTILO A MANTER (não mudar):
- Fundo azul-marinho escuro, tipo telão de estádio, com feixes de luz de holofote
  saindo dos cantos superiores esquerdo e direito.
- Ícone de holofotes/arquibancada no canto superior esquerdo.
- Título em duas linhas, fonte impact/condensada em caixa alta, efeito 3D cromado:
  primeira linha em prata/cromado, segunda linha em dourado.
- 4 painéis lado a lado, mesma largura, fundo azul-marinho translúcido, borda dourada
  em estilo "HUD de e-sports" (cantos em L), com selo numerado dourado (1 a 4) no
  canto superior esquerdo de cada painel.
- Proporção da imagem: 2688x1152 (ou equivalente ~2.33:1).
- Bandeiras/escudos de confederação e ícones simples quando aplicável.

CONTEÚDO (substituir 100% do conteúdo anterior — não deve sobrar nenhuma menção a
"país-sede", "campanha coletiva" ou "naturalização"):

Título:
Linha 1 (prata): "3 PERGUNTAS SOBRE A COPA:"
Linha 2 (dourado): "ANÁLISE SQL (1994-2026)"

Painel 1 — "ARTILHEIRO x CAMPEÃO"
Número grande: "2 de 14"
Legenda: "TIMES DO ARTILHEIRO QUE SAÍRAM CAMPEÕES DESDE 1994"
Nota pequena: "MBAPPÉ: 10 GOLS EM 2026, FRANÇA TERMINOU EM 4º LUGAR"

Painel 2 — "FORMA DE CLUBE"
Número grande: "7 A 42"
Legenda: "GOLS DE CLUBE DOS ARTILHEIROS NA TEMPORADA ANTERIOR À COPA"
Nota pequena: "RONALDO VENCEU A CHUTEIRA DE OURO DE 2002 COM SÓ 7"

Painel 3 — "TETO x VOLUME (CAF/AFC)"
Elemento visual: escudos da AFC e da CAF, cada um com "VAGAS: 2 → 9" (AFC) e
"VAGAS: 3 → 10" (CAF)
Legenda: "VAGAS QUASE TRIPLICARAM DESDE 1994 — O TETO DE DESEMPENHO NÃO ACOMPANHOU"
Nota pequena: "MELHOR RESULTADO FOI EM ANOS COM MENOS VAGAS (2002 E 2022)"

Painel 4 — "STACK & VALIDAÇÃO"
Ícone SQL: "SQL: JOINS, SUBQUERIES, CASE, GROUP BY"
Ícone Python: "PYTHON: PANDAS, MATPLOTLIB, SEABORN"
Linha extra: "DEEP RESEARCH (GEMINI) + VALIDAÇÃO: ERRO REAL CORRIGIDO"

OBJETIVO: este banner acompanha um projeto de portfólio no GitHub voltado a
recrutadores de Análise de Dados/BI. Precisa ser lido e entendido em menos de
5 segundos por alguém escaneando o perfil. Priorize números grandes e legíveis,
alto contraste, sem poluição visual. Revise a ortografia de cada palavra antes de
finalizar (a versão anterior teve um erro de digitação). Gere em alta resolução
(mínimo 2688x1152px).
```

### Depois de gerar

1. Confira a ortografia de cada painel com atenção antes de aprovar — já tivemos um
   erro de digitação numa rodada anterior.
2. Salve substituindo `assets/banner.png` na pasta do projeto.
3. Se o Manus gerar em outro formato (jpg/webp), converta pra `.png` antes de substituir.
4. Depois de trocar o arquivo, inclua no commit final (`git add assets/banner.png`).
