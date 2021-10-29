# 25/04/2021
# Experiência Criativa: Navegando pela Computação
# Professor: Tiago Adelino Navarro - Adilson Galiano Filho
# Alunos: Gabriely de Andrade da Costa, Gustavo Shindi Shimizu, João Guilherme Lass, Marcelo Freitas Junior,
# Marcos Jesus da Silva, Méllanie Kassim Padilha Taveira, Willian Rodrigues de Almeida.


# Atividade Avaliativa 2

# A partir de um programa base desenvolvido em Python (em anexo) para a área degestão acadêmica, você deve
# evoluí lo, alterando funções existentes ou implementando novas que atendam aos seguintes requisitos
# funcionais:

# RF001: Gerenciar dados dos estudantes;
# RF002: Gerenciar dados dos professores;
# RF003: Gerenciar dados das disciplinas;
# RF004: Gerenciar dados das turmas;
# RF005: Gerenciar dados das matrículas;
# RF006: Listagem de matrículas;

import json
import os

# função para escrever em um arquivo json (olhar na pasta do seu projeto, sera criado um
# arquivo .json com o nome da tabela passada por parametro)
def escrever_json(data, file_name):
    with open(file_name + '.json', 'w') as f:
        json.dump(data, f, indent=4)
        f.close()
        
# função para ler em um arquivo json e colocar em memoria
def ler_json(file_name):
    data = {}
    try:
        with open(file_name + '.json', 'r') as f:
            data = json.load(f)
            f.close()
            return data
    except FileNotFoundError:
        escrever_json(data, file_name)
        return data

# função para criar um novo registro em um arquivo json 
def criar_novo_registro(file_name):
    data = ler_json(file_name)
    novo = {}
    id = '1'
    ids = [int(k) for k in data.keys()]
    if len(ids) != 0:
        id = str(max(ids) + 1)
    colunas = eval(file_name)
    print('INCLUSÃO', file_name,'\n')
    for coluna in colunas:
        print('Informe',coluna)
        valor = input()
        novo[coluna] = valor
    data[id] = novo
    escrever_json(data, file_name)


def ler_registro(file_name):
    data = ler_json(file_name)
    registro = None
    identificador = None
    sim = True
    while sim:
        identificador = input('Entre com o ID:')
        if identificador in data.keys():
            registro = data[identificador]
            print('Registro =', registro)
            sim = False
        else:
            print('ID sem registro!')
            resposta = input('Deseja buscar outro ID? (sim / não)').lower()
            if 'não' in resposta:
                sim = False

    return registro, identificador

 # função para atualizar um registro em um arquivo json a partir de um ID  
def atualizar_registro(file_name):
    data = ler_json(file_name)
    print('ATUALIZAÇÃO', file_name,'\n')
    registro, identificador = ler_registro(file_name)
    if registro is None or identificador is None:
        print('O ID do registro não pode ser nulo!')
        finalizar_programa()
    colunas = eval(file_name)
    for coluna in colunas:
        valor = input(f'Informe {coluna}: ')
        registro[coluna] = valor
    data[identificador] = registro
    escrever_json(data, file_name)
    print(f'Registro {identificador} alterado!')

# funçao para remover um novo registro em um arquivo json  a partir de um ID
def remover_registro(file_name):
    data = ler_json(file_name)
    print('EXCLUSÃO', file_name,'\n')
    registro, identificador = ler_registro(file_name)
    if registro is None or identificador is None:
        print('O ID do registro não pode ser nulo!')
    else:
        print('Confirma a remoção do ID:',identificador,'? (sim / não)\n'
                     'OBS: Essa operação não pode ser desfeita!')
        confirma = input().lower()
        if 'sim' in confirma:
            data.pop(identificador)
            escrever_json(data, file_name)
            print('Registro', identificador,'removido!')
        else:
            print('A remoção do registro:', identificador,'foi cancelada!')


# função para buscar registros em um arquivo json  a partir de um texto
def buscar_por_coluna(file_name):
    data = ler_json(file_name)
    print('BUSCA', file_name,'\n')
    if len(data) == 0:
        print('Base vazia!')
    else:
        while True:
            resultados = {}
            texto = input('Entre com o termo que deseja buscar: ').lower()
            for identificador, registro in data.items():
                for coluna, valor in registro.items():
                    if texto in valor.lower():
                        resultados[identificador] = registro
                        continue
            print(resultados)
            refazer = input('Deseja buscar por outro termo? (sim / não)')
            if 'sim' not in refazer:
                break

def listar_registro(file_name):
    data = ler_json(file_name)
    print('LISTAGEM', file_name, '\n')
    if len(data) == 0:
        print('Base vazia!')
    else:
        print(f"{len(data)} registros encontrados. \n")
        for item in data:
            if file_name == 'estudantes':
                     print(f"id: {item} - Nome: {data[item]['nome_estudante']} {data[item]['sobrenome_estudante']} ")
            elif file_name == 'professores':
                     print(f"id: {item} - Professor: {data[item]['nome_professor']} {data[item]['sobrenome_professor']} ")
            elif file_name == 'disciplinas':
                    print(f"id: {item} -Codigo da Disciplina: {data[item]['codigo_disciplina']} - Nome da disciplina: {data[item]['nome_disciplina']}")
            elif file_name == 'turmas':
                    print(f"id: {item} - Turma: {data[item]['codigo_turma']} - Professor:{data[item]['cod_professor']} - {data[item]['cod_disciplina']} " )
            elif file_name == 'matriculas':
                    print(f"id: {item} - Codigo da turma: {data[item]['codigo_turma']} Codigo do estudante: {data[item]['codigo_estudante']} ")

    input('Tecle uma tecla para continuar ...')


def finalizar_programa():
    print('Finalizando o programa...')
    exit(0)

# def limpar_tela():
#     print('\n' * 100)

def linhas(): #! para deixar melhor para visualização
    print('~-~'*16)

def operacao(tabela):
    opcoes = ['1', '2', '3', '4', '5', '6']
    ativo = True
    while ativo:
        os.system('cls') or None
         #! colocamos um comando para limpar o terminal os.system('cls') or None #O "cls" é comando que limpa o terminal do windows para o MAC usa "clear"
        linhas()
        print('O que você deseja fazer na base', tabela, ':\n\n'
                '1. Criar novo registro.\n'
                '2. Atualizar registro.\n'
                '3. Excluir registro.\n'
                '4. Buscar registro.\n'
                '5. Listar registro.\n'
                '6. Voltar menu.\n\n',
                'Digite o número da operação que deseja realizar: ')
        opcao = input()
        
        if opcao not in opcoes:
            input('Opção inválida! Por favor, tente novamente.')
        else:
            os.system('cls') or None
            #!
            if opcao == '1':
                criar_novo_registro(tabela)
            elif opcao == '2':
                atualizar_registro(tabela)
            elif opcao == '3':
                remover_registro(tabela)
            elif opcao == '4':
                buscar_por_coluna(tabela)
            elif opcao == '5':
                listar_registro(tabela)
            elif opcao == '6':
                ativo = False


def menu():
    opcoes = ['1', '2', '3', '4', '5', '6']
    ativo = True
    while ativo:
        os.system('cls') or None
        #!
        opcao = op() #! chamando a função
        if opcao in opcoes:
            if   opcao == '1':
                operacao(tabela1)
            elif opcao == '2':
                operacao(tabela2)
            elif opcao == '3':
                operacao(tabela3)
            elif opcao == '4':
                operacao(tabela4)
            elif opcao == '5':
                operacao(tabela5)
            elif opcao == '6':
                ativo = False
            else:
                print('Opcao invalida! Tente novamente.')

    finalizar_programa()

def op(): #! definimos uma função para deixar o codigo mais limpo 
    linhas()
    opcao = input('Selecione a opcao desejada:\n\n'
                      '1. Gerenciar estudantes.\n'
                      '2. Gerenciar professores.\n'
                      '3. Gerenciar diciplinas.\n'
                      '4. Gerenciar turmas.\n'
                      '5. Gerenciar matrículas.\n'
                      '6. Sair.\n\n'
                      'Faca sua escolha: ')                
    return opcao


if __name__ == '__main__':
    # definindo os nomes das colunas para a tabela estudantes
    estudantes = ['codigo_estudante', 'nome_estudante', 'sobrenome_estudante']
    professores = ['codigo_professor', 'nome_professor', 'sobrenome_professor']
    disciplinas = ['codigo_disciplina', 'nome_disciplina']
    turmas = ['codigo_turma', 'cod_professor', 'cod_disciplina']
    matriculas = ['codigo_turma', 'codigo_estudante' ]


    # nome da tabela deve ser o mesmo nome da variavel
    tabela1 = 'estudantes'
    tabela2 = 'professores'
    tabela3 = 'disciplinas'
    tabela4 = 'turmas'
    tabela5 = 'matriculas'

    # Seguindo o mesmo exemplo de criacao das tabelas pode-se criar quantas
    # forem necessarias

    # chamada principal do programa
    menu()

            
