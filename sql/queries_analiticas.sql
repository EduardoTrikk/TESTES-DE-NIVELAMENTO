------------------------ 10 operadoras com maiores despesas nos últimos 3 meses------------------------

----------------------------------- Sem_distincacao_de_modalidade------------------------------
SELECT 
    o.registro_operadora AS reg_ans,
    o.razao_social,
    dc.descricao,
    o.modalidade,
    SUM(CAST(REPLACE(dc.vl_saldo_final, ',', '.') AS DECIMAL(10,2))) AS total_despesas
FROM demonstracoes_contabeis dc
JOIN operadoras_ativas o ON dc.reg_ans = o.registro_operadora
WHERE 
    dc.descricao LIKE 'EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE'
    AND YEAR(dc.data) = 2024 
    AND MONTH(dc.data) = 10
GROUP BY 
    o.registro_operadora, o.razao_social, o.modalidade, dc.descricao
ORDER BY 
    total_despesas DESC
LIMIT 10;

------------------------------------ modalidades_distintas-------------------------------------

SELECT 
    d.reg_ans,
    d.descricao,
    d.modalidade,
    d.total_despesas
FROM (
    SELECT 
        o.registro_operadora AS reg_ans,
        dc.descricao,
        TRIM(o.modalidade) AS modalidade, 
        SUM(CAST(REPLACE(dc.vl_saldo_final, ',', '.') AS DECIMAL(10,2))) AS total_despesas,
        ROW_NUMBER() OVER (
            PARTITION BY TRIM(o.modalidade) 
            ORDER BY SUM(CAST(REPLACE(dc.vl_saldo_final, ',', '.') AS DECIMAL(10,2))) DESC
        ) AS ranking
    FROM demonstracoes_contabeis dc
    JOIN operadoras_ativas o ON dc.reg_ans = o.registro_operadora
    WHERE 
        dc.descricao LIKE 'EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE'
        AND YEAR(dc.data) = 2024 
        AND MONTH(dc.data) = 10
    GROUP BY 
        o.registro_operadora, dc.descricao, o.modalidade
) AS d
WHERE d.ranking = 1
ORDER BY d.total_despesas DESC
LIMIT 10;


-------------------------- 10 operadoras com maiores despesas no último ano----------------------------

SELECT 
    d.reg_ans,
    d.razao_social,
    d.modalidade,
    d.total_despesas,
    CONCAT('R$ ', FORMAT(d.total_despesas, 2, 'de_DE')) AS despesa_formatada
FROM (
    SELECT 
        o.registro_operadora AS reg_ans,
        o.razao_social,
        TRIM(o.modalidade) AS modalidade,
        SUM(CAST(REPLACE(dc.vl_saldo_final, ',', '.') AS DECIMAL(16,2))) AS total_despesas
    FROM demonstracoes_contabeis dc
    JOIN operadoras_ativas o ON dc.reg_ans = o.registro_operadora
    WHERE 
        dc.descricao LIKE 'EVENTOS/SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE'
        AND YEAR(dc.data) = 2023
    GROUP BY 
        o.registro_operadora, o.razao_social, o.modalidade
) AS d
ORDER BY d.total_despesas DESC
LIMIT 10;