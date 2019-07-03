#!/usr/bin/env python2.7
import psycopg2
import os


def print_logo():
  print("\n██████╗  █████╗ ████████╗ █████╗ ███████╗██╗     ██╗██╗  ██╗");
  print("██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██║     ██║╚██╗██╔╝");
  print("██║  ██║███████║   ██║   ███████║█████╗  ██║     ██║ ╚███╔╝ ");
  print("██║  ██║██╔══██║   ██║   ██╔══██║██╔══╝  ██║     ██║ ██╔██╗ ");
  print("██████╔╝██║  ██║   ██║   ██║  ██║██║     ███████╗██║██╔╝ ██╗");
  print("╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝╚═╝  ╚═╝\n");
  print("------------------------------------------------------------");
  print("Your Database for Films and Series");
  print("------------------------------------------------------------");
  print("Made by: Astelio Weber and Rodrigo N. Wuerdig");
  print("------------------------------------------------------------");

def consulta_filmes():
  postgreSQL_select_Query = "select distinct NOME_MIDIA from midia"
  cursor.execute(postgreSQL_select_Query)
  print("Selecting rows from midia table using cursor.fetchall")
  filmes = cursor.fetchall()
  for row in filmes:
    print(row)
  input("Press [Enter] to continue...")
  menu()

def conta_maior_fatura():
  postgreSQL_select_Query = "select NICKNAME from conta natural join cobranca natural join fatura group by VALOR, NICKNAME having VALOR = (select max(VALOR)from fatura);"
  cursor.execute(postgreSQL_select_Query)
  print("Selecionando Tupla contendo o NICKNAME que tem a maior Fatura")
  user = cursor.fetchone()
  print("A conta" + str(user[0]) + "tem a maior fatura!")
  input("Press [Enter] to continue...")
  menu()

def diretor_filme_mais_antigo():
  postgreSQL_select_Query = "select distinct NOMED from diretor where IDd in (select distinct IDd from dirige natural join midia group by ANO, IDd having ANO = (select min(ANO) from midia));"
  cursor.execute(postgreSQL_select_Query)
  diretores = cursor.fetchall()
  for diretor in diretores:
  	print("O diretor" + str(diretor[0]) + ", dirigiu o filme mais antigo registrado.")
  input("Press [Enter] to continue...")
  menu()

def contas_adult_only():
  postgreSQL_select_Query = "select distinct NICKNAME from conta c1 Where not exists (select * From possui natural join perfil 	Where EMAIL = c1.EMAIL and NOME_PERFIL IN (select distinct NOME_PERFIL From possui natural join perfil	Where KIDS = '1'));"
  cursor.execute(postgreSQL_select_Query)
  adults_only = cursor.fetchall()
  for adult in adults_only:
    print("O conta" + str(adult[0]) + ", não é utilizada por crianças.")
  input("Press [Enter] to continue...")
  menu()

def senha_fraca():
  postgreSQL_select_Query = "select EMAIL, SENHA_DIGEST from conta group by EMAIL having 8 > CHAR_LENGTH(SENHA_DIGEST);"
  cursor.execute(postgreSQL_select_Query)
  noobies = cursor.fetchall()
  for noob in noobies:
    print("A conta de EMAIL:" + str(noob[0]) + "\nTem uma senha muito fraca! Senha:" + str(noob[1]))
  input("Press [Enter] to continue...")
  menu()

def titulo_maisfav():
  postgreSQL_select_Query = "select max(distinct TITULO) from favoritos;"
  cursor.execute(postgreSQL_select_Query)
  user = cursor.fetchone()
  print("A midia mais favoritada é:" + str(user[0]))
  input("Press [Enter] to continue...")
  menu()

def tempo_assistido():
  name = input("Tempo total assistido por?");
  postgreSQL_select_Query = "select sum(TEMPO_ASSISTIDO) from assiste where NOME_PERFIL='" + name + "'"
  cursor.execute(postgreSQL_select_Query)
  tempo = cursor.fetchone()
  print("O perfil " + name + ", assistiu DataFlix por " + str(tempo[0]))
  input("Press [Enter] to continue...")
  menu()

 
menuItems = [
    { "Tempo assistido por [entrada]": tempo_assistido },
    { "Contas com Senha Fraca": senha_fraca },
    { "Consultar Filmes": consulta_filmes },
    { "Conta que tem a maior fatura": conta_maior_fatura },
    { "Diretor do Filme mais Antigo Registrado": diretor_filme_mais_antigo },
    { "Contas que não são usadas por crianças": contas_adult_only },
    { "Midia Mais Favoritada": titulo_maisfav },
    { "Exit": exit },
]

def menu():
  while True:
    os.system('clear')
    print_logo();
    for item in menuItems:
        print("["+str(menuItems.index(item))+"]" + list(item.keys())[0])
    choice = input(">> ")
    try:
        if int(choice) < 0 : raise ValueError
        list(menuItems[int(choice)].values())[0]()
    except (ValueError, IndexError):
        pass

try:
    connection = psycopg2.connect(user = "postgres",
                                  password = "postgres",
                                  host = "127.0.0.1",
                                  port = "5432",
                                  database = "postgres")
    cursor = connection.cursor()
    print ( connection.get_dsn_parameters(),"\n")
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connected to - ", record,"\n")
except (Exception, psycopg2.Error) as error :
    print ("Error while connecting to PostgreSQL", error)
finally:
    #closing database connection.
        if(connection):
            menu();
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
