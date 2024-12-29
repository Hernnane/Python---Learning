# Importando o módulo CSV (armazena dados em formato tabular)
import json

#informações a serem adicionadas no arquivo dados.json
dados = {
    "Nome": "Hernnane",
    "Idade": 26,
    "Cidade": "São Paulo"
}
#informações a serem adicionadas no arquivo dados.json
dados2 = {
    "Nome": "Guilherme",
    "Idade": 22,
    "Cidade": "SP"
}

# Abertura do arquivo com o WITH em modo READ para recuperar os dados ja existentes no arquivo dados.json
with open('dados.json', 'r', encoding='utf-8') as arquivo:
    dados_existentes = json.load(arquivo)

# Adiciona informações novas ao na variável que recuperamos os dados ja existentes anteriormente
dados_existentes['pessoa_3'] = dados2

# Abertura do arquivo com o WITH em modo WRITE para escrever os dados da variável 'dados_existentes' (nela estão TODAS as infos antigas e novas)
with open('dados.json', 'w', encoding='utf-8') as arquivo:
    # Ensure Ascii => Garante a exibição correta de caracteres especiais
    # Indent => Identa as informações exibidas no arquivo JSON
    json.dump(dados_existentes, arquivo, ensure_ascii=False, indent=4)