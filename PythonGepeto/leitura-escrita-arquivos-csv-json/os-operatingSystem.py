# OS => Biblioteca padrão Python / Interações com o sistema operacional
import os

# Salva o diretório escolhido na variável 'pasta'
pasta = 'C:/Users/User/Desktop/Python/PythonGepeto-Itau'

# Lista todos os arquivos existentes no diretório 'pasta' e salva em 'arquivos'
arquivos = os.listdir(pasta) 

# Looping para exibir todos os arquivos existentes no repositório
for arquivo in arquivos:
    print(arquivo)