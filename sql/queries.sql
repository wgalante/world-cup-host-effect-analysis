-- =============================================================================
-- queries.sql
-- World Cup Data Analysis (1994-2026) -- 3 Questions
--
-- Tables (1994-2026, 9 editions -- the span between the two World Cups held
-- in the USA): compiled via Gemini Pro Deep Research and independently
-- validated against primary sources before loading (see README "Metodologia
-- e Validação de Dados" for the correction log).
--
--   TOP_SCORERS    -> each edition's top scorer + club-season form immediately before the tournament
--   TEAM_RESULTS    -> every team, every edition, with confederation and furthest stage reached (296 rows)
--
-- Course reference: IBM "Databases and SQL for Data Science with Python"
-- (Coursera). SQL techniques (joins, subqueries, aggregates, GROUP BY, CASE)
-- applied to an original dataset compiled for this project.
-- =============================================================================


-- -----------------------------------------------------------------------------
-- PERGUNTA 1: A forma do artilheiro no clube, na temporada anterior, prevê o
-- artilheiro da Copa? Ou o faro de gol na Copa é independente da forma de clube?
-- -----------------------------------------------------------------------------
SELECT YEAR, PLAYER_NAME, COUNTRY, WC_GOALS, CLUB_GOALS_PRIOR_SEASON
FROM TOP_SCORERS
ORDER BY YEAR;

-- Faixa de variação: de 7 gols de clube (Ronaldo, 2002, limitado por lesões)
-- a 42 (Mbappé, 2025-26) -- não há um piso mínimo de "forma" que se repita.
SELECT
    ROUND(AVG(CLUB_GOALS_PRIOR_SEASON), 1) AS MEDIA_GOLS_CLUBE,
    MIN(CLUB_GOALS_PRIOR_SEASON) AS MIN_GOLS_CLUBE,
    MAX(CLUB_GOALS_PRIOR_SEASON) AS MAX_GOLS_CLUBE
FROM TOP_SCORERS;


-- -----------------------------------------------------------------------------
-- PERGUNTA 2: A seleção do artilheiro sai campeã? JOIN entre TOP_SCORERS e
-- TEAM_RESULTS pelo ano + país.
-- -----------------------------------------------------------------------------
SELECT ts.YEAR, ts.PLAYER_NAME, ts.COUNTRY, ts.WC_GOALS, tr.STAGE_REACHED
FROM TOP_SCORERS ts
JOIN TEAM_RESULTS tr ON ts.YEAR = tr.YEAR AND ts.COUNTRY = tr.TEAM
ORDER BY ts.YEAR;

-- Contagem: em 9 edições (1994-2026, com 2 artilheiros empatados em 2010 e
-- 2 artilheiros contabilizados em 2026), a seleção do artilheiro só foi
-- campeã 2 vezes (Ronaldo 2002, David Villa 2010) -- o resto ficou pelo
-- caminho, incluindo o próprio Mbappé em 2026 (4º lugar).
SELECT
    CASE WHEN tr.STAGE_REACHED = 'Campeão' THEN 'Sim' ELSE 'Não' END AS TIME_CAMPEAO,
    COUNT(*) AS NUM_EDICOES
FROM TOP_SCORERS ts
JOIN TEAM_RESULTS tr ON ts.YEAR = tr.YEAR AND ts.COUNTRY = tr.TEAM
GROUP BY TIME_CAMPEAO;


-- -----------------------------------------------------------------------------
-- PERGUNTA 3: CAF e AFC ganharam mais vagas a cada edição (volume) -- mas o
-- teto de desempenho (melhor resultado alcançado) cresceu na mesma proporção,
-- ou é um jogo de "mais vagas, mesmo teto"? Escala ordinal de fase:
-- 1=Campeão, 2=Vice, 3=3º Lugar, 4=4º Lugar, 5=Quartas, 6=Oitavos,
-- 6.5=16-avos (novo em 2026), 7=Fase de Grupos. Menor valor = melhor.
-- -----------------------------------------------------------------------------
SELECT
    slots.YEAR,
    slots.CONFEDERATION,
    slots.NUM_VAGAS,
    ceiling.MELHOR_RANK
FROM (
    SELECT YEAR, CONFEDERATION, COUNT(*) AS NUM_VAGAS
    FROM TEAM_RESULTS
    WHERE CONFEDERATION IN ('CAF', 'AFC')
    GROUP BY YEAR, CONFEDERATION
) slots
JOIN (
    SELECT
        YEAR,
        CONFEDERATION,
        MIN(
            CASE STAGE_REACHED
                WHEN 'Campeão' THEN 1
                WHEN 'Vice-campeão' THEN 2
                WHEN 'Terceiro Lugar' THEN 3
                WHEN 'Quarto Lugar' THEN 4
                WHEN 'Quartos de final' THEN 5
                WHEN 'Oitavos de final' THEN 6
                WHEN '16 avos de final' THEN 6.5
                WHEN 'Fase de Grupos' THEN 7
            END
        ) AS MELHOR_RANK
    FROM TEAM_RESULTS
    WHERE CONFEDERATION IN ('CAF', 'AFC')
    GROUP BY YEAR, CONFEDERATION
) ceiling
ON slots.YEAR = ceiling.YEAR AND slots.CONFEDERATION = ceiling.CONFEDERATION
ORDER BY slots.CONFEDERATION, slots.YEAR;

-- Achado: as vagas da AFC saltaram de 2 (1994) para 9 (2026), e da CAF de 3
-- para 10 -- crescimento real de volume. Mas o teto (melhor rank) NÃO
-- acompanha esse crescimento de forma monotônica: o melhor resultado
-- histórico da AFC segue sendo a Coreia do Sul em 2002 (4º lugar, rank 4,
-- justamente num ano de MENOS vagas), e o melhor da CAF é Marrocos em 2022
-- (4º lugar, rank 4, com apenas 5 vagas). Em 2026, com quase o dobro de
-- vagas de qualquer edição anterior, nem CAF nem AFC bateram esse teto.
