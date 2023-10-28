
---CRIANDO PROC BRASILEIRAO 2022
create table artilharia (
nome varchar,
equipe varchar,
gols numeric);

insert into artilharia values
('Germán Cano', 'Fluminense', 26),
('Pedro Raul', 'Goiás', 19),
('Jonathan Calleri', 'São Paulo', 18),
('Bissoli', 'Avaí', 14),
('Marcos Leonardo', 'Santos', 13),
('Hulk', 'Atl. Mineiro', 12),
('Terans', 'Atl. Paranaense', 12),
('Rony', 'Palmeiras', 12),
('Pedro', 'Flamengo', 11),
('Gabriel', 'Flamengo', 11);

WITH DADOS AS (
    SELECT * 
	FROM artilharia
	ORDER BY GOLS DESC
)
SELECT *,CONCAT(ROW_NUMBER() OVER(),'º Artilheiro') AS SeQUENCIAL --definindo posição dos artilheiros
FROM DADOS
order by gols desc limit 5;

--MINHA PROC
CREATE OR REPLACE FUNCTION identificar_artilheiros() 
RETURNS TABLE (posicao INT, nome VARCHAR, equipe VARCHAR, gols NUMERIC) AS
$$
BEGIN
	--Se possui 5 registros ou mais retorna os 5 primeiros por ordem decrescente de gols com limite de 5 registros.
    IF (SELECT COUNT(*) FROM artilharia) >= 5 THEN
        RETURN QUERY
        SELECT 
            ROW_NUMBER() OVER (ORDER BY a.gols DESC)::INT as posicao,
            a.nome,
            a.equipe,
            a.gols
        FROM artilharia a
        ORDER BY a.gols DESC
        LIMIT 5;
	--Se não: retorna os registros por ordem decrescente de gols.
    ELSE
        RETURN QUERY
        SELECT 
            ROW_NUMBER() OVER (ORDER BY a.gols DESC)::INT as posicao,
            a.nome,
            a.equipe,
            a.gols
        FROM artilharia a
        ORDER BY a.gols DESC;
    END IF;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM identificar_artilheiros();
