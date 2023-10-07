--Criando sequence para tabela sem campo SERIAL

CREATE TEMPORARY SEQUENCE auto_sequence
    INCREMENT BY 1
	MINVALUE 1
    START WITH 1;
--DROP sequence auto_sequence;

--serial atual
SELECT CURRVAL ('auto_sequence');
--serial sequente
SELECT NEXTVAL ('auto_sequence');

--criando tabela sem serial
CREATE TEMPORARY TABLE auto (
        id int PRIMARY KEY DEFAULT NEXTVAL ('auto_sequence'),
        nome VARCHAR(30) NOT NULL
);
--DROP TABLE if exists auto;

--Inserindo valores 
INSERT INTO auto (nome) VALUES ('Arthur Gheno');

--Quando o ID é setado, deve ser ajustado via CURRVAL ou NEXTVAL
INSERT INTO auto (id, nome) VALUES (2, 'Arthur Gheno');

INSERT INTO auto (nome) VALUES ('Gabriele dos Santos b');

SELECT * FROM auto;

