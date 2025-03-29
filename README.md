# Teste de Nivelamento
Olá, me chamo Eduardo, sou responsável pelo desenvolvimento deste arquivo.
Primeiramente, gostaria de agradecer pela oportunidade cedida a mim por este teste!

## 📣 Tecnologias Utilizadas
- Python 3.12
- MySQL 8^

## 📣 Requisitos para rodar o projeto
- MySQL Workbench instalado
- Python instalado
  
## 📣 O que foi feito
### 1 - Desenvolvimento

O projeto se inicia na criação do **webscraper**, com a criação das funções: 
- compact_manager,
- download_manager,
- link_extractor,
- select_folder e
- scrapper.

O compact_manager é responsável por compactar arquivos, sendo possível adicionar arquivos extras à pasta após a compactação, ele realiza a compactação em formato ZIP.

O download_manager, essa função realiza a nomeação e alocação do arquivo para a pasta escolhida, utilizando o nome "anexo" e incrementando em 1 se não existir um arquivo anterior com o mesmo nome.

O link_extractor realiza a identificação de links encontrados na página e carrega a URL da página de verificação e retorna para a main se há ou não links.

O scrapper faz buscas das tags <a> da web vinculadas, ele as busca e identifica se possuem o termo "anexo" como link, retornando se houve ou não resultados. Se houver, ele retorna os links para o download_manager, que vai utilizá-los como parâmetro de download.

O select_folder é apenas uma função de seleção de pasta, tornando mais prático a execução do código e o arquivamento dos dados e a execução da main.
Por fim, temos a main, que recebe essas funções e exibe prints para mostrar o andamento do processo, através destas funções, ele retorna os sucessos e os erros ou cancelamentos que podem ocorrer na operação.

### 2 - SQL
 
1 - Foi feito o download dos arquivos dos diretórios e alocados em uma pasta específica. 

2 - Criação do banco de dados com as tabelas e materiais de apoio fornecidos. 

3 - Execução das queries de importação, com uso de **Procedure**.

4 - Queries analíticas com consultas no banco importado, verificando as operadoras com maiores despesas no último trimestre e as operadoras com maior despesa no último ano, para essa busca, eu acredito que a modalidade se referia à operadora e me baseei nisso para buscar e concluir esta etapa.


## Instruções para testar a aplicação.

## 1 - Clone o repositório e abra a pasta

```bash
git clone https://github.com/EduardoTrikk/TESTES-DE-NIVELAMENTO.git
```
```bash
cd TESTES-DE-NIVELAMENTO
```
Abra com seu editor de código (ex: Visual Studio Code)

### Faça o ambiente virtual
```bash
python3.12 -m venv .venv
```
Ative
```bash
.venv/Scripts/activate #Windows
source .venv/bin/activate #Linux
```
Instale 
```bash
pip install -r requirements.txt
```


## 2 - TESTE DE WEB SCRAPING E TESTE DE TRANSFORMAÇÃO DE DADOS

Dentro do seu editor de código, no terminal faça:
```bash
cd src
```
```bash
python main.py
```
Baixe os arquivos em alguma pasta.

## 3 - TESTE DE BANCO DE DADOS

Copie e cole ou abra os arquivos no MySQL Workbench e execute.

## OBS
**Obs 1:** Alguns dos programas utilizam caminhos dos dados locais de onde se encontram os diretórios do projeto. Infelizmente, não consegui encontrar uma lógica para utilizar variáveis globais ou algum método que facilitasse o acesso de forma automática. Esse problema pode aparecer na pasta api_server, no arquivo server.py, e nas importações do SQL.

✨ Muito obrigado por sua atenção!
