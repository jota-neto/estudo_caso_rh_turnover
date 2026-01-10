-- =========================================================
-- 04_turnover_tempo_empresa.sql
-- Objetivo: Analisar o turnover de acordo com o tempo
--           de empresa (em faixas de anos)
-- =========================================================

SELECT
    -- Criação de faixas de tempo de empresa
    CASE
        WHEN tempo_de_empresa <= 1 THEN '0-1 ano'
        WHEN tempo_de_empresa BETWEEN 2 AND 4 THEN '2-4 anos'
        WHEN tempo_de_empresa BETWEEN 5 AND 9 THEN '5-9 anos'
        ELSE '10+ anos'
    END AS faixa_tempo_empresa,

    -- Taxa de turnover por faixa de tempo
    ROUND(
        SUM(
            CASE
                WHEN funcionario_deixou_empresa = 'Sim' THEN 1
                ELSE 0
            END
        )::DECIMAL
        /
        COUNT(*),
        2
    ) AS taxa_turnover

FROM
    base_rh

GROUP BY
    faixa_tempo_empresa

ORDER BY
    faixa_tempo_empresa;
