import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def scraper(url):
    """ Extrai os links dos anexos da página."""
    # faz a solicitação HTTP
    response = requests.get(url)
    response.raise_for_status() # verifica se a solicitação foi bem-sucedida
    
    # passa o HTML para o BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # encontra os links com <a> tags
    links = []
    for a_tag in soup.find_all('a', href=True):
        href = a_tag['href']
        
        # verifica se o link contém "Anexo" e termina com ".pdf"
        if 'Anexo' in href and href.endswith('.pdf'):
            # constrói o URL completo
            full_url = urljoin(url, href)
            links.append(full_url)
    
    return links