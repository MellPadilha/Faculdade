import os
import random
num_ocul= random.randrange(0,31)
num_informados = []
tentativas = 10

print ('Seja bem-vindo ao jogo de advinhação, você deve acertar o numero entre 0 a 30 e serão o total de 10 tentativas.')
print ('Regras: 1. Utilize apenas numeros inteiros') 
print ('2. Ao final do jogo o numero secreto será revelado')
print ('Boa sorte jogador!!!!')

while tentativas >= 0:
    if tentativas ==0:
        print('Sinto muito, ja acabaram suas tentativas')
        break
    numero = int(input('Digite um numero:'))
    os.system('cls') or None #O "cls" é comando que limpa o terminal do windows para o MAC usa "clear"
    if numero == num_ocul:
        print ('Voce acertou!!!!!')
        break

    elif numero in num_informados:
        print('Esse numero ja se encontra na lista de numeros ja tentados')
        print('Numeros ja tentados:',num_informados)
        print('Tenta outro numero!!!!')
       
    elif numero > num_ocul:
        print('O numero digitado é maior que o numero oculto')
        num_informados.insert(tentativas,numero)
        tentativas = tentativas - 1  
        print('tentativas restantes:', tentativas)
        print ('Numeros ja tentados',num_informados)
         
    elif numero < num_ocul:
        print ('O numero digitado é menor que o numero oculto')
        num_informados.insert(tentativas,numero)
        tentativas = tentativas - 1   
        print('tentativas restantes:', tentativas)
        print ('Numeros ja tentados',num_informados)  


num_informados.sort()
print ('Os numeros que você tentou foram:',num_informados)
print ('O menor numero da lista é:', num_informados[0], 'O maior numero da lista é:', num_informados[-1])
print ('O numero secreto era:', num_ocul)


#Deixei uma assinatura para garantir que ninguem copie o meu codigo: os.system (só a versão final do arquivo possue essa linha)