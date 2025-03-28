import os
import requests

def download_manager(links, download_folder):
    """Faz o download dos arquivos para a pasta especificada."""
    if not os.path.exists(download_folder):
        os.makedirs(download_folder) #cria a pasta caso ela nao exista
    
    for i, link in enumerate(links):
        file_name = os.path.join(download_folder, f"Anexo_{i+1}.pdf")
        
        if os.path.exists(file_name):
            print(f"O arquivo {file_name} já existe. Ignorando download.")
            continue

        try:    
            response = requests.get(link, stream=True)
            response.raise_for_status()  
            
            # salva o arquivo
            with open(file_name, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            print(f"Downloaded: {file_name}")
        
        except requests.exceptions.RequestException as e:
            print(f"Error downloading {link}: {e}")