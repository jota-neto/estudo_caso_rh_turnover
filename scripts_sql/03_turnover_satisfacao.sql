-- =========================================================
-- 03_turnover_satisfacao.sql
-- Objetivo: Avaliar a relação entre nível de satisfação
--           dos funcionários e o turnover
-- =========================================================

SELECT
    nivel_satisfacao,

    -- Taxa de turnover por nível de satisfação
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
    nivel_satisfacao

ORDER BY
    taxa_turnover DESC;
