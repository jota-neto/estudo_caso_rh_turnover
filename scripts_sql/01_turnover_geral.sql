-- =========================================================
-- 01_turnover_geral.sql
-- Objetivo: Calcular a taxa geral de turnover da empresa
-- =========================================================

SELECT
    -- Calcula a taxa geral de turnover:
    -- número de funcionários que saíram
    -- dividido pelo total de funcionários
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
    ) AS taxa_turnover_geral
FROM
    base_rh;
