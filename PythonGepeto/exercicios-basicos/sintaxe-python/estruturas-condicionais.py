# Exercício sobre Sintaxe Básica (Variáveis, Tipos de Dados, Estruturas Condicionais e de Repetição)

'''
Crie um programa que leia a idade de uma pessoa e imprima:

    "Você é menor de idade" se a pessoa for menor de 18 anos.
    "Você é maior de idade" se a pessoa for maior ou igual a 18 anos.
'''

idade = int(input('Insira sua idade: '))

if idade >= 18:
    print('Você é maior de idade!')
else:
    print('Você é menor de idade!')