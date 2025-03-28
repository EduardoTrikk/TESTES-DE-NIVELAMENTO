import zipfile
import os

def compact_manager(folder, file_name, extra_files=None):
    """Compacta todos os arquivos da pasta especificada em um único arquivo ZIP,
    incluindo arquivos adicionais passados em extra_files."""
    
    # Compacta os arquivos da pasta
    with zipfile.ZipFile(file_name, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for source, dirs, files in os.walk(folder):
            for file in files:
                if file.endswith('.pdf'):
                    full_path = os.path.join(source, file)
                    zipf.write(full_path, os.path.relpath(full_path, folder))
        
        # Se 'extra_files' for fornecido, adiciona esses arquivos ao ZIP
        if extra_files:
            for extra_file in extra_files:
                if os.path.exists(extra_file):
                    zipf.write(extra_file, os.path.basename(extra_file))
                else:
                    print(f"Arquivo extra não encontrado: {extra_file}")
                    
    print(f"Arquivos compactados em {file_name}")