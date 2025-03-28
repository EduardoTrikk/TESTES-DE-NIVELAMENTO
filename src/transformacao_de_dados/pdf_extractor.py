import os
import pandas as pd
import pdfplumber

def pdf_extractor(pdf_path, folder):
    """Extrai a tabela do PDF e salva em um CSV."""
    data = []

    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            if not tables:
                continue
            
            for table in tables:
                for row in table:
                    cleaned_row = [cell.strip() if isinstance(cell, str) else (cell or '') for cell in row]
                    data.append(cleaned_row)

    # Criação do DataFrame
    df = pd.DataFrame(data)

    # Lista esperada de colunas
    columns_list = ["PROCEDIMENTO", "RN (alteração)", "VIGÊNCIA", "OD", "AMB", "HCO",
                    "HSO", "REF", "PAC", "DUT", "SUBGRUPO", "GRUPO", "CAPÍTULO"]

    # Verifica se o número de colunas corresponde às colunas esperadas
    if df.shape[1] == len(columns_list):
        df.columns = columns_list
    else:
        print(f"Aviso: Número inesperado de colunas ({df.shape[1]}). Verifique os dados extraídos.")
        print("Primeiras linhas dos dados extraídos:")
        print(df.head())

    # Substitui abreviações em "OD" e "AMB"
    if "OD" in df.columns:
        df["OD"] = df["OD"].replace({"S": "Seg. Odontológica", "N": "Não"})
    if "AMB" in df.columns:
        df["AMB"] = df["AMB"].replace({"S": "Seg. Ambulatorial", "N": "Não"})

    # Caminho do arquivo CSV
    csv_path = os.path.join(folder, "Rol_Procedimentos.csv")

    # Salva o DataFrame no CSV com o delimitador adequado
    df.to_csv(csv_path, index=False, encoding="utf-8-sig", sep=";")  # Usando ponto e vírgula como delimitador

    print(f"CSV salvo em: {csv_path}")
    return csv_path