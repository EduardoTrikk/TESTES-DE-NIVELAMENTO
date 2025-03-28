import os
from transformacao_de_dados.pdf_extractor import pdf_extractor
from web_scraping.download_manager import download_manager
from functions.select_folder import select_folder
from web_scraping.link_extractor import link_extractor
from web_scraping.compact_manager import compact_manager

def main():
    # Extrai os links dos anexos da página
    attachments = link_extractor()
    
    # Seleciona a pasta para download e compactação e verifica se foi selecionada
    folder = select_folder()

    print(f"Pasta selecionada: {folder}")
    print("Baixando anexos...")

    # Baixa os anexos para a pasta selecionada
    download_manager(attachments, folder)

    print("Compactando anexos...")

    # Após o download, compacta os anexos na mesma pasta
    compact_manager(folder, os.path.join(folder, 'Anexos.zip'))

    # Extrai a tabela do PDF e salva como CSV
    pdf_path = os.path.join(folder, "Anexo_1.pdf")
    csv_file = pdf_extractor(pdf_path, folder)

    # Compactar CSV gerado
    zip_path = os.path.join(folder, "Teste_Eduardo_Patrick.zip")
    compact_manager(folder, zip_path, extra_files=[csv_file])

    print(f"Processo concluído! Arquivo compactado: {zip_path}")
    

if __name__ == "__main__":
    main()