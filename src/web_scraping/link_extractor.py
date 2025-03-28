from web_scraping.scraper import scraper

def link_extractor():
    page_url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'

    # Extrai os links dos anexos da página
    attachments = scraper(page_url)
    
    # Verifica se foram encontrados links
    if attachments:
        print("Anexos encontrados para download:")
        for link in attachments:
            print(link)
    else:
        print("Nenhum link de anexo encontrado na página.")
    
    return attachments
