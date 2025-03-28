USE ans_data;

-------------------------- Relatorio_cadop.csv------------------------

LOAD DATA INFILE 'E:/Projeto/data/operadoras/Relatorio_cadop.csv' -- localizacao_do_CSV_na_maquina
INTO TABLE operadoras_ativas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_operadora, cnpj, razao_social, nome_fantasia,
modalidade, logradouro, numero, complemento, bairro,
cidade, uf, cep, ddd, telefone, fax,
endereco_eletronico, representante, cargo_representante,
regiao_de_comercializacao, @data_registro_ans)
SET data_registro_ans = NULLIF(@data_registro_ans, '');


-------------------------- Tabelas_de_demonstração_contábil_2023.csv------------------------

LOAD DATA INFILE 'E:/Projeto/data/tabelas_2023/1T2023.csv' -- localizacao_do_CSV_na_maquina
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


LOAD DATA INFILE 'E:/Projeto/data/2t2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


LOAD DATA INFILE 'E:/Projeto/data/tabelas_2023/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


LOAD DATA INFILE 'E:/Projeto/data/tabelas_2023/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%d/%m/%Y'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


-------------------------- Tabelas_de_demonstração_contábil_2024.csv------------------------

LOAD DATA INFILE 'E:/Projeto/data/tabelas_2024/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


LOAD DATA INFILE 'E:/Projeto/data/tabelas_2024/2t2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


LOAD DATA INFILE 'E:/Projeto/data/tabelas_2024/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');


LOAD DATA INFILE 'E:/Projeto/data/tabelas_2024/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'),
    vl_saldo_inicial = REPLACE(REPLACE(TRIM(vl_saldo_inicial), ',', '.'), '\r', ''),
    vl_saldo_final = REPLACE(REPLACE(TRIM(vl_saldo_final), ',', '.'), '\r', '');