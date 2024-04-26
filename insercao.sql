INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('VOLVO', 'CURITIBA');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Joao da Silva CURITIBA VOLVO_CURITIBA', 'Rua 1', 'Curitiba', '10-Oct-2000', '12345678901');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'JOAO DA SILVA CURITIBA VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Mauricio Turion CURITIBA VOLVO_CURITIBA', 'Rua 1', 'Curitiba', '04-Jul-1999', '12345678902');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 1000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'MAURICIO TURION CURITIBA VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Marcos Atheros ARAUCÁRIA VOLVO_CURITIBA', 'Rua Wire', 'Araucária', '26-Mar-1971', '12345678903');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 1500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'MARCOS ATHEROS ARAUCÁRIA VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Nathalia Nokia CURITIBA VOLVO_CURITIBA', 'Rua 47', 'Curitiba', '07-Jun-1990', '12345678904');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 2000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'NATHALIA NOKIA CURITIBA VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO' AND cidade = 'CURITIBA')
);

INSERT INTO gerente (
	SELECT DISTINCT gerente, emp FROM 
		(SELECT codE AS gerente FROM empregado WHERE nome = 'JOAO DA SILVA CURITIBA VOLVO_CURITIBA'),
		(SELECT codE AS EMP FROM empregado WHERE nome IN (
			'MAURICIO TURION CURITIBA VOLVO_CURITIBA', 
			'MARCOS ATHEROS ARAUCÁRIA VOLVO_CURITIBA',
			'NATHALIA NOKIA CURITIBA VOLVO_CURITIBA'
		))
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Ana Nora COLOMBO VOLVO_CURITIBA', 'Rua Abacateiro', 'Colombo', '07-Jun-1990', '12345678905');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 2500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'ANA NORA COLOMBO VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Joana Maria COLOMBO VOLVO_CURITIBA', 'Rua Abacateiro', 'Colombo', '07-Jun-1990', '12345678906');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 3000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'JOANA MARIA COLOMBO VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Joao Maria COLOMBO VOLVO_CURITIBA', 'Rua Abacateiro', 'Colombo', '07-Jun-1980', '12345678907');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 3500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'JOAO MARIA COLOMBO VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Mariana COLOMBO VOLVO_CURITIBA', 'Rua Morango', 'Colombo', '07-Jun-2003', '12345678908');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 100000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'MARIANA COLOMBO VOLVO_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'VOLVO'AND cidade = 'CURITIBA')
);

INSERT INTO gerente (
	SELECT DISTINCT GERENTE, emp FROM 
	(SELECT codE AS gerente FROM empregado WHERE nome = 'ANA NORA COLOMBO VOLVO_CURITIBA'),
	(SELECT codE AS EMP FROM empregado WHERE nome IN ('JOANA MARIA COLOMBO VOLVO_CURITIBA', 'JOAO MARIA COLOMBO VOLVO_CURITIBA', 'MARIANA COLOMBO VOLVO_CURITIBA'))
);



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('BOSCH', 'São Paulo');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Maria Mia SAOPAULO BOSCH_SAOPAULO', 'Avenida Paulista', 'São Paulo', '13-Sep-1987', '12345678909');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 4500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'MARIA MIA SAOPAULO BOSCH_SAOPAULO'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH'AND cidade = 'SÃO PAULO')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Erick Crisal SAOPAULO BOSCH_SAOPAULO', 'Avenida Paulista', 'São Paulo', '14-Feb-1985', '12345678910');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 5000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'ERICK CRISAL SAOPAULO BOSCH_SAOPAULO'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH'AND cidade = 'SÃO PAULO')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Carlos Crisal SAOPAULO BOSCH_SAOPAULO', 'Avenida Paulista', 'São Paulo', '14-Feb-1988', '12345678911');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 5500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'CARLOS CRISAL SAOPAULO BOSCH_SAOPAULO'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH'AND cidade = 'SÃO PAULO')
);

INSERT INTO gerente (
	SELECT DISTINCT GERENTE, emp FROM 
	(SELECT codE AS gerente FROM empregado WHERE nome = 'MARIA MIA SAOPAULO BOSCH_SAOPAULO'),
	(SELECT codE AS EMP FROM empregado WHERE nome IN ('ERICK CRISAL SAOPAULO BOSCH_SAOPAULO', 'CARLOS CRISAL SAOPAULO BOSCH_SAOPAULO'))
);



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('BOSCH', 'CURITIBA');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Joao 2 CURITIBA BOSCH_CURITIBA', 'Rua 1', 'Curitiba', '10-Oct-1987', '12345678912');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 2000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'JOAO 2 CURITIBA BOSCH_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH'AND cidade = 'CURITIBA')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Mauricio Antonio CURITIBA BOSCH_CURITIBA', 'Rua 64 bits', 'Curitiba', '04-Jul-1985', '12345678913');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 2000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'MAURICIO ANTONIO CURITIBA BOSCH_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH'AND cidade = 'CURITIBA')
);

INSERT INTO gerente (
	SELECT DISTINCT GERENTE, emp FROM 
	(SELECT codE AS gerente FROM empregado WHERE nome = 'JOAO 2 CURITIBA BOSCH_CURITIBA'),
	(SELECT codE AS EMP FROM empregado WHERE nome IN ('MAURICIO ANTONIO CURITIBA BOSCH_CURITIBA'))
);



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('BOSCH', 'BLUMENAU');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Marcos At BLUMENAU BOSCH_BLUMENAU', 'Rua Quente', 'Blumenau', '26-Mar-1990', '12345678914');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 7000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'MARCOS AT BLUMENAU BOSCH_BLUMENAU'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'BOSCH'AND cidade = 'BLUMENAU')
);



INSERT INTO COMPANHIA (NOME, CIDADE) VALUES ('FIRST BANK CORPORATION', 'CURITIBA');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Carlos Eduardo CURITIBA FBC_CURITIBA', 'Rua XV de Novembro', 'Curitiba', '10-Oct-1992', '12345678915');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 7500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'CARLOS EDUARDO CURITIBA FBC_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'FIRST BANK CORPORATION'AND cidade 
= 'CURITIBA'));

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('José Pedro Silveira SJP FBC_CURITIBA', 'Avenida Principal', 'São José dos Pinhais', '05-Sep-1989', '12345678916');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 8000 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'JOSÉ PEDRO SILVEIRA SJP FBC_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'FIRST BANK CORPORATION'AND cidade 
= 'CURITIBA'));

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Feliciano Radeon CURITIBA FBC_CURITIBA', 'Avenida Batel', 'Curitiba', '12-Aug-1968', '12345678917');

INSERT INTO trabalha (codE, CodC, salario)(
	SELECT DISTINCT code, codc, 8500 FROM
	(SELECT codE AS CodE FROM empregado WHERE nome = 'FELICIANO RADEON CURITIBA FBC_CURITIBA'),
	(SELECT codc AS Codc FROM companhia WHERE NOME = 'FIRST BANK CORPORATION'AND cidade 
= 'CURITIBA'));

INSERT INTO gerente (
	SELECT DISTINCT GERENTE, emp FROM 
	(SELECT codE AS gerente FROM empregado WHERE nome = 'CARLOS EDUARDO CURITIBA FBC_CURITIBA'),
	(SELECT codE AS EMP FROM empregado WHERE nome IN ('JOSÉ PEDRO SILVEIRA SJP FBC_CURITIBA', 'FELICIANO RADEON CURITIBA FBC_CURITIBA'))
);



INSERT INTO companhia (nome, cidade) VALUES ('Small Bank Corporation', 'São Paulo');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Maria Air SAOPAULO SBC_SAOPAULO', 'Rua 3', 'São Paulo', '04-Feb-1980', '12345678918');

INSERT INTO trabalha (CODE, CODC, salario)(
	SELECT DISTINCT code, codc, 9000 FROM
	(SELECT CODE FROM EMPREGADO WHERE nome = 'MARIA AIR SAOPAULO SBC_SAOPAULO'),
	(SELECT CODC FROM COMPANHIA WHERE nome = UPPER('Small Bank Corporation'))
);



INSERT INTO companhia (nome, cidade) VALUES ('XX Corporation', 'São Paulo');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('John Philips SAOPAULO XXC_SAOPAULO', 'Rua Preset', 'São Paulo', '18-Feb-1978', '12345678919');

INSERT INTO trabalha (CODE, CODC, salario)(
	SELECT DISTINCT code, codc, 9500 FROM
	(SELECT code FROM empregado WHERE nome = 'JOHN PHILIPS SAOPAULO XXC_SAOPAULO'),
	(SELECT codc FROM companhia WHERE nome = UPPER('XX Corporation'))
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Peter Parker SAOPAULO SBC_SAOPAULO', 'Marginal Tietê', 'São Paulo', '05-Jun-1987', '12345678920');

INSERT INTO trabalha (CODE, CODC, salario)(
	SELECT DISTINCT code, codc, 10000 FROM
	(SELECT code FROM empregado WHERE nome = 'PETER PARKER SAOPAULO SBC_SAOPAULO'),
	(SELECT codc FROM companhia WHERE nome = UPPER('XX Corporation'))
);



INSERT INTO companhia (nome, cidade) VALUES ('New Corporation', 'Blumenau');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Paulo S. Mormaii BLUMENAU NW_BLUMENAU', 'Avenida Beira-mar', 'Blumenau', '14-Mar-1990', '12345678921');

INSERT INTO trabalha (CODE, CODC, salario)(
	SELECT DISTINCT code, codc, 10500 FROM
	(SELECT code FROM empregado WHERE nome = 'PAULO S. MORMAII BLUMENAU NW_BLUMENAU'),
	(SELECT codc FROM companhia WHERE nome = UPPER('New Corporation'))
);



INSERT INTO companhia (nome, cidade) VALUES ('Old Corporation', 'São Paulo');

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Pedro Misael SAOPAULO OC_SAOPAULO', 'Rua pequena', 'Curitiba', '13-Sep-1987', '12345678922');

INSERT INTO trabalha (CODE, CODC, salario)(
	SELECT DISTINCT code, codc, 11000 FROM
	(SELECT code FROM empregado WHERE nome = 'PEDRO MISAEL SAOPAULO OC_SAOPAULO'),
	(SELECT codc FROM companhia WHERE nome = UPPER('Old Corporation'))
);


INSERT INTO gerente(
	SELECT 'Joao da Silva CURITIBA VOLVO_CURITIBA', nome FROM empregado WHERE cidade in ('Curitiba', 'Blumenau', 'Araucária', 'São José dos Pinhais')
);


INSERT INTO gerente (
	SELECT 'Pedro Misael', nome FROM empregado WHERE cidade in ('São Paulo')
);

INSERT INTO empregado(nome, rua, cidade, dt_nasc, cpf)
VALUES ('Ana Paula CURITIBA NONE', 'Rua 12', 'Curitiba', '10-Oct-1987', '12345678923');

COMMIT