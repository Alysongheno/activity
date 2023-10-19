--Criando a tabela
CREATE TABLE colaborador (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10,2),
    tempo_carteira NUMERIC
);

--Populando com dados fictícios
INSERT INTO colaborador (nome, salario, tempo_carteira) VALUES 
    ('Arthur', 1800, 14),
    ('Marina', 2600, 23),
    ('Geovani', 3800, 45),
    ('Gabriele', 3490, 30),
    ('Amaral', 4700, 30),
    ('Marcelo', 9300, 15);


WITH --primeira CTE referente aos descontos
descontos AS (
    SELECT 
        TRUNC(
            CASE --descontos_INSS identificados em um site aleatório 
                WHEN salario <= 1320 THEN salario * 0.075
                WHEN salario > 1320.01 AND salario <= 2571.29 THEN salario * 0.09
                WHEN salario > 2571.30 AND salario <= 3856.94 THEN salario * 0.12
                WHEN salario > 3856.95 AND salario <= 7507.49 THEN salario * 0.14
                ELSE 0
            END, 2
        ) AS desconto_INSS,
        TRUNC(
            CASE --descontos_IRFF identificados em um site aleatório
                WHEN salario <= 2112 THEN salario * 0
                WHEN salario > 2112.01 AND salario <= 2826.65 THEN salario * 0.075
                WHEN salario > 2826.66 AND salario <= 3751.05 THEN salario * 0.15
                WHEN salario > 3751.06 AND salario <= 4664.68 THEN salario * 0.2250
                WHEN salario > 4664.68 THEN salario * 0.2750
                ELSE 0
            END, 2
        ) AS desconto_IRFF,			
        CASE --Passando todos que trabalharam mais de 12 meses, para 12
            WHEN tempo_carteira > 12 THEN 12 
            ELSE tempo_carteira
        END AS qtd_meses_trab, 
        *
    FROM colaborador
), primeira_parcela AS (
    SELECT  
        TRUNC(salario / 12 * qtd_meses_trab / 2, 2) AS parcela_1_decimo,
        TRUNC(salario - desconto_Inss - desconto_irff, 2) AS salario_liquido,
        *
    FROM descontos 
)
SELECT  
    nome,
    salario AS salario_bruto,
    desconto_Inss,
    desconto_irff,
    salario_liquido,
    parcela_1_decimo,
    TRUNC(salario_liquido - parcela_1_decimo, 2) AS segunda_parcela 
FROM primeira_parcela;
