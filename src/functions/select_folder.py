from tkinter import Tk
from tkinter.filedialog import askdirectory

def select_folder():
    """Abre uma janela para o usuário selecionar a pasta para download e compactação dos anexos."""
    root = Tk()
    root.withdraw()
    download_folder = askdirectory(title="Selecione a pasta para salvar os Anexos")
    
    if not download_folder:
        print("Nenhuma pasta selecionada. Abortando...")
        
    return download_folder