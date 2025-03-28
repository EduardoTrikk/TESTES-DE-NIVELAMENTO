CREATE DATABASE IF NOT EXISTS ans_data;
USE ans_data;

CREATE TABLE IF NOT EXISTS operadoras_ativas (
  registro_operadora VARCHAR(15),
  cnpj VARCHAR(14),
  razao_social VARCHAR(140),
  nome_fantasia VARCHAR(140),
  modalidade VARCHAR(50),
  logradouro VARCHAR(40),
  numero VARCHAR(20),
  complemento VARCHAR(40),
  bairro VARCHAR(30),
  cidade VARCHAR(30),
  uf CHAR(2),
  cep VARCHAR(8),
  ddd VARCHAR(4),
  telefone VARCHAR(20),
  fax VARCHAR(20),
  endereco_eletronico VARCHAR(255),
  representante VARCHAR(50),
  cargo_representante VARCHAR(40),
  regiao_de_comercializacao VARCHAR(255),
  data_registro_ans DATE,
  INDEX (cnpj)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
  data DATE,
  reg_ans INT,
  cd_conta_contabil BIGINT,
  descricao VARCHAR(255),
  vl_saldo_inicial  VARCHAR(255),
  vl_saldo_final VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

