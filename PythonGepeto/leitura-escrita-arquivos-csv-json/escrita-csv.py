# Importando o módulo CSV (armazena dados em formato tabular)
import csv

# IMPORTANTE CONTROLAR OS ESPAÇAMENTOS PRA EVITAR INFORMAÇÕES BAGUNÇADAS NOS ARQUIVOS FINAIS

# Informações a serem adicionadas no arquivos dados.csv
dados = [
            ["Nome", "Hernnane"],
            ["Idade", 26], 
            ["Cidade", "São Paulo"]
        ]

# Informações a serem adicionadas no arquivos dados.csv
dados2 = [
            ["Nome", "Gabriel"],
            ["Idade", 26], 
            ["Cidade", "São Bernardo do Campo"]
        ]

with open('dados.csv', 'r', encoding='utf-8') as arquivo:
    dados_existentes = list(csv.reader(arquivo))  # Converte o conteúdo para uma lista

# Adicionando os novos dados
for dado in dados2:
    dados_existentes.append(dado) # Adiciona linha por linha das novas informações

# Abertura do arquivo com o WITH em modo WRITE para adicionar as informações ao arquivo
with open('dados.csv', 'w', encoding='utf-8') as arquivo:
    escritor = csv.writer(arquivo)
    escritor.writerows(dados_existentes)