import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime
from sqlalchemy.exc import SQLAlchemyError

def executar_consulta_e_gravar():
    senha = '@inserir_senha'
    senha_codificada = senha.replace('@', '%40')
    origem_engine = create_engine(f'postgresql+psycopg2://cresol_etl:{senha_codificada}@host:porta/database')

    query_sql = "@inserir_consulta"
    df = pd.read_sql_query(query_sql, origem_engine)
    
    senha_dw = '@inserir_senha'
    senha_codificada_dw = senha_dw.replace('@', '%40')
    destino_engine = create_engine(f'postgresql+psycopg2://cresol_baser_etl:{senha_codificada_dw}@host:porta/database')

    try:
        df.to_sql(name='@inserir_tabela', con=destino_engine, if_exists='append', index=False, schema='@inserir_schema')
    except SQLAlchemyError as erro:
        print("Erro ao inserir registro:", erro)

# Executa a função
hora_atual = datetime.now().time()
print(f"Inicio STG: {hora_atual.strftime('%H:%M:%S')}")

executar_consulta_e_gravar()

hora_atual = datetime.now().time()
print(f"Fim STG: {hora_atual.strftime('%H:%M:%S')}")
