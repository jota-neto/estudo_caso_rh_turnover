-- =========================================================
-- 02_turnover_hora_extra.sql
-- Objetivo: Analisar a taxa de turnover por realização de
--           hora extra (Sim / Não)
-- =========================================================

SELECT
    faz_hora_extra,

    -- Taxa de turnover por grupo de hora extra
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
    faz_hora_extra

ORDER BY
    taxa_turnover DESC;
