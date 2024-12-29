# Importando o módulo CSV (armazena dados em formato tabular)
import csv

# With => abrir e fechar automaticamente os arquivos / 'r' => Modo (r = leitura / w = escrita) / Encoding => caracteres especiais
with open('dados.csv', 'r', encoding='utf-8') as arquivo:
    leitor = csv.reader(arquivo)
    for linha in leitor:
        print(linha)