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
  print("Your Database for Film and Series Info");
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
 
menuItems = [
    { "Consultar Filmes": consulta_filmes },
    { "Call bar": bar },
    { "Exit": exit },
]

def menu():
  while True:
    os.system('clear')
    # Print some badass ascii art header here !
    print_logo();
    for item in menuItems:
        print("["+str(menuItems.index(item))+"]" + list(item.keys())[0])
    choice = input(">> ")
    try:
        if int(choice) < 0 : raise ValueError
        # Call the matching function
        menuItems[int(choice)].values()[0]()
    except (ValueError, IndexError):
        pass

def main():
  try:
      connection = psycopg2.connect(user = "postgres",
                                    password = "postgres",
                                    host = "127.0.0.1",
                                    port = "5432",
                                    database = "postgres")
      cursor = connection.cursor()
      # Print PostgreSQL Connection properties
      print ( connection.get_dsn_parameters(),"\n")
      # Print PostgreSQL version
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

if __name__ == "__main__":
    main();