import hashlib
import random

def homeScreen(option=None):
    print("\nBem vindo. Escolha uma das opções abaixo:")
    try:
        option = int(input(" 1. Login \n 2. Fazer cadastro \n 3. Sair \n 4. Segredinho "))
    except:
        print('Error')
    
    if option == 1:
        userAcess()
    elif option == 2:
        userRegister()
    elif option == 3:
        print("Bye Bye\n")
    elif option == 4:
        print("Este código pertence a Méllanie, Gabriely e Lidia") #marca d'agua 

    else:
        print("Opção inválida\n")
        homeScreen()

def userRegister():
    print("Criando novo usuario. Digite um nome para o usuario e uma senha de 4 caracteres \n")
    database = open("db.txt", "a+")
    login = input(str("Usuário:"))
    senha = input(str("Senha:"))
    confirmacaoSenha = input(str("Confirme sua senha:"))
    lusuarios = []   # l = lista
    lsenhas = []
    for i in database:
        a, b = i.split(" - ")
        b = b.strip()
        lusuarios.append(a)
        lsenhas.append(b)
    data = dict(zip(lusuarios, lsenhas))

    if senha != confirmacaoSenha: 
        print("As senhas digitadas não são igual, use a mesma senha nos dois campos.")
        return userRegister
    else:
        if len(senha) < 4:
            print("A senha precisa ter no minimo quatro caracteres")
            return homeScreen()
        elif login in lusuarios:
            print("Esse usuário ja existe")
            return homeScreen()
        else:
            numReforco1=str(random.randrange(0,9))
            numReforco2=str(random.randrange(0,9))
            senhaS = senha + numReforco1 + numReforco2
            enCode = senhaS.encode()
            primeiroHash = hashlib.md5(enCode).hexdigest()
            enCodeh = primeiroHash.encode()
            segundoHash = hashlib.md5(enCodeh).hexdigest() #reforçando o hash

            with open("db.txt", "a") as f: # = append
                # f.write(login + " - " + primeiroHash + "\n") primeira versão com a senha simplificada
                f.write(login + " - " + segundoHash + "\n")
                f.close()
            with open("hash.txt", "a") as f: # = append
                f.write(segundoHash + "\n")
                f.close()
            print("Usuário cadastrado\n")
            homeScreen()

def userAcess():
    database = open("db.txt", "r")
    entradaLogin = input(str("Login:"))
    entradaSenha = input(str("Senha:"))
    auth = entradaSenha.encode()
    authHash = hashlib.md5(auth).hexdigest()

    if not len(entradaLogin or entradaSenha) <1:
        lusuarios = []   # l = lista
        lsenhas = []
        for i in database:
            a, b = i.split(" - ")
            b = b.strip()
            lusuarios.append(a)
            lsenhas.append(b)
        data = dict(zip(lusuarios, lsenhas))
    
    try:
        if data[entradaLogin]:
            try:
                if authHash == data [entradaLogin]:
                    print(f"Sucesso!! Você está logado, aproveite [{entradaLogin}] \n")
                    return homeScreen()
                else:
                    print("Usuário incorreto")
                    return homeScreen()
            except:
                print("Algum dado está incorreto, verifique seus dados de acesso.")
                return homeScreen()
        else:
            print("ops! Parece que você não tem conta aqui, você pode realizar o cadastro e tentar novamente!")
            return homeScreen
    except:
        print("ops! Parece que não temos essa senha ou usuário cadastrado")
    


homeScreen()