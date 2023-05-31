#Importando libs
import psycopg2
import pandas as pd
from datetime import date, timedelta

#Criando conexão com o BD
try:
    conn=psycopg2.connect("host='' dbname='' port='' user='' password=''")
    print("Conectamos na base!")
except:
    print("Conexão falhou!")
    
#Criando variavel para o dia
dia_atual = date.today()

#Executando o SQL e criando variável com o retorno da execucao
nossa_remessa = pd.read_sql('''select dados from tabela;''',conn)

print(nossa_remessa)

#Extraindo o resultado em um arquivo xlsx
try:
    nossa_remessa.to_excel(f'/Local/Nome_do_arquivo_{dia_atual}.xlsx', index = False, encoding='utf-8')
    print("Arquivo extraído com sucesso!")
except:
    print("Erro na extração do relatório!")
    
