-- Primeiro é necessário criar as tabelas com o script Oficina_2_p1

-- EMPREGADO EMPREGADO EMPREGADO EMPREGADO EMPREGADO EMPREGADO EMPREGADO 
-- EMPREGADO EMPREGADO EMPREGADO EMPREGADO EMPREGADO EMPREGADO EMPREGADO 
DROP SEQUENCE SeqPkEmpregado;
CREATE SEQUENCE SeqPkEmpregado START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TriPkEmpregado
BEFORE UPDATE OR INSERT ON empregado
FOR EACH ROW 
DECLARE 
	novo_cod NUMBER (5);
BEGIN
	IF inserting THEN
		SELECT SeqPkEmpregado.nextval INTO novo_cod FROM dual;
		:NEW.codE := novo_cod;
	END IF;
	
	:NEW.nome := upper(:NEW.nome);
	:NEW.rua := upper(:NEW.rua);
	:NEW.cidade := upper(:NEW.cidade);
	:NEW.cpf := upper(:NEW.cpf);
	:NEW.rg := upper(:NEW.rg);
	:NEW.mae := upper(:NEW.mae);
END;


-- COMPANHIA COMPANHIA COMPANHIA COMPANHIA COMPANHIA COMPANHIA COMPANHIA
-- COMPANHIA COMPANHIA COMPANHIA COMPANHIA COMPANHIA COMPANHIA COMPANHIA
DROP SEQUENCE SeqPkCompanhia;
CREATE SEQUENCE SeqPkCompanhia START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TriPkCompanhia
BEFORE UPDATE OR INSERT ON companhia
FOR EACH ROW
DECLARE
	novo_cod NUMBER (5);
BEGIN
	IF inserting THEN
		SELECT SeqPkCompanhia.nextval INTO novo_cod FROM dual;
		:NEW.codC := novo_cod;
	END IF;

	:NEW.nome_companhia := upper(:NEW.nome_companhia);
	:NEW.cidade := upper(:NEW.cidade);
END;


-- INSERÇÃO DE DADOS INSERÇÃO DE DADOS INSERÇÃO DE DADOS INSERÇÃO DE DADOS INSERÇÃO DE DADOS
-- INSERÇÃO DE DADOS INSERÇÃO DE DADOS INSERÇÃO DE DADOS INSERÇÃO DE DADOS INSERÇÃO DE DADOS

-- Companhia em 3 cidades
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 1', 'Cidade 1');
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 1', 'Cidade 2');
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 1', 'Cidade 3');
-- Companhia em 2 cidades
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 2', 'Cidade 2');
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 2', 'Cidade 3');
-- Companhia em 1 cidade
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 3', 'Cidade 3');
INSERT INTO COMPANHIA (NOME_COMPANHIA, CIDADE) VALUES ('Companhia 4', 'Cidade 4');



-- Empregados da Companhia 1 
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 1', 'Rua 1', 'Cidade 1','00000000001', '13-Mar-2000', '000000001','Mae 1', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 2', 'Rua 2', 'Cidade 2','00000000002', '13-Mar-2000', '000000002','Mae 2', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 3', 'Rua 3', 'Cidade 3','00000000003', '13-Mar-2000', '000000003','Mae 3', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 4', 'Rua 4', 'Cidade 1','00000000004', '13-Mar-2000', '000000004','Mae 4', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 5', 'Rua 5', 'Cidade 1','00000000005', '13-Mar-2000', '000000005','Mae 5', 'F');
-- Empregados da Companhia 2
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 6', 'Rua 6', 'Cidade 2','00000000006', '13-Mar-2000', '000000006','Mae 6', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 7', 'Rua 7', 'Cidade 3','00000000007', '13-Mar-2000', '000000007','Mae 7', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 8', 'Rua 8', 'Cidade 2','00000000008', '13-Mar-2000', '000000008','Mae 8', 'M');
-- Empregados da Companhia 3
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 9', 'Rua 9', 'Cidade 3','00000000009', '13-Mar-2000', '000000009','Mae 9', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 10', 'Rua 10', 'Cidade 3','00000000010', '13-Mar-2000', '000000010','Mae 10', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 11', 'Rua 11', 'Cidade 3','00000000011', '13-Mar-2000', '000000011','Mae 11', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 12', 'Rua 12', 'Cidade 3','00000000012', '13-Mar-2000', '000000012','Mae 12', 'M');
-- Empregados da Companhia 4
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 13', 'Rua 13', 'Cidade 4','00000000013', '13-Mar-2000', '000000013','Mae 13', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 14', 'Rua 14', 'Cidade 4','00000000014', '13-Mar-2000', '000000014','Mae 14', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 15', 'Rua 15', 'Cidade 4','00000000015', '13-Mar-2000', '000000015','Mae 15', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 16', 'Rua 16', 'Cidade 4','00000000016', '13-Mar-2000', '000000016','Mae 16', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 17', 'Rua 17', 'Cidade 4','00000000017', '13-Mar-2000', '000000017','Mae 17', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 18', 'Rua 18', 'Cidade 4','00000000018', '13-Mar-2000', '000000018','Mae 18', 'M');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregada 19', 'Rua 19', 'Cidade 4','00000000019', '13-Mar-2000', '000000019','Mae 19', 'F');
INSERT INTO EMPREGADO (NOME, RUA, CIDADE, CPF, DATA_NASC, RG, MAE, SEXO) VALUES ('Empregado 20', 'Rua 20', 'Cidade 4','00000000020', '13-Mar-2000', '000000020','Mae 20', 'M');



-- Trabalha na Companhia 1
INSERT INTO trabalha (codE, codC, salario) VALUES (1, 1, 1000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (2, 1, 2000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (3, 1, 3000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (4, 1, 4000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (5, 1, 5000.00);
-- Trabalha na Companhia 2
INSERT INTO trabalha (codE, codC, salario) VALUES (6, 2, 1000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (7, 2, 2000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (8, 2, 3000.00);
-- Trabalha na Companhia 3
INSERT INTO trabalha (codE, codC, salario) VALUES (9, 3, 4000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (10, 3, 5000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (11, 3, 1000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (12, 3, 2000.00);
-- Trabalha na Companhia 4
INSERT INTO trabalha (codE, codC, salario) VALUES (13, 4, 1000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (14, 4, 2000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (15, 4, 3000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (16, 4, 4000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (17, 4, 5000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (18, 4, 6000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (19, 4, 7000.00);
INSERT INTO trabalha (codE, codC, salario) VALUES (20, 4, 8000.00);



-- Gerente da Companhia 1 é o Empregado 5
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (5, 1);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (5, 2);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (5, 3);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (5, 4);
-- Gerente da Companhia 2 é o Empregado 8
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (8, 7);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (8, 6);
-- Gerente da Companhia 3 é o Empregado 12
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (12, 9);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (12, 10);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (12, 11);
-- Os Gerentes da Companhia 4 são os Empregados 16 e 20
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (16, 13);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (16, 14);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (16, 15);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (20, 17);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (20, 18);
INSERT INTO gerente (codE_gerente, codE_empregado) VALUES (20, 19);