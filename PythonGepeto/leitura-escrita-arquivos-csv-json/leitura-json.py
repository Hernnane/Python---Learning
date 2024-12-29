# Importando o módulo CSV (armazena dados em formato tabular)

import json

with open('dados.json', 'r', encoding='utf-8') as arquivo:
    dados = json.load(arquivo)
    print(dados)