---1. Mostre todos os empregados e suas companhias. Utilize apelido para as tabelas e campos. 
--- (use produto cartesiano e where).
SELECT e.NOME AS nome_empregado, c.NOME AS nome_companhia 
FROM EMPREGADO e, COMPANHIA c, TRABALHA t  
WHERE e.CODE = t.CODE AND t.CODC = c.CODC;

---2. Mostre todos os empregados e suas companhias. Utilize apelido para as tabelas e campos. 
--- (use inner join).
SELECT e.NOME AS nome_empregado, c.nome AS nome_companhia
FROM EMPREGADO e
INNER JOIN TRABALHA t ON t.CODE = e.CODE
INNER JOIN COMPANHIA c ON c.CODC = t.CODC;

---3. Mostre todos os empregados com ou sem vínculo com companhias. 
-- Para os empregados com companhias as mostre.
SELECT e.nome AS nome_empregado, c.nome AS nome_companhia
FROM EMPREGADO e
FULL JOIN TRABALHA t ON t.CODE = e.CODE 
LEFT JOIN COMPANHIA c ON t.CODC = c.CODC;

---4. Mostre todos os empregados com ou sem vínculo com companhias.
--- Mostre todas as companhias com ou sem empregados. 
--- Para os empregados com companhias as mostre. 
--- Para as companhias com empregados os mostre.
SELECT e.nome AS nome_empregado, c.nome FROM EMPREGADO e
FULL JOIN TRABALHA t ON t.code = e.CODE 
FULL JOIN COMPANHIA c ON c.codc = t.codc;

---5. Apenas verificar as próximas queries

---6. Mostre os empregados que moram nas cidades de Curitiba, Pinhais, Colombo e Araucária 
--- (use lista e se necessário a função upper para transformar em maiúsculo)
SELECT e.nome AS nome_empregado FROM EMPREGADO e, COMPANHIA c, TRABALHA t 
WHERE e.code = t.code AND t.codc = c.codc AND c.cidade IN ('CURITIBA', 'PINHAIS', 'COLOMBO', 'ARAUCÁRIA');

---7. Mostre os empregados que não moram nas cidades de Colombo e Araucária
SELECT e.nome AS nome_emp FROM EMPREGADO e
WHERE e.CIDADE NOT IN ('COLOMBO', 'ARAUCÁRIA');

---8. Mostre o dígito verificador dos CPF
SELECT SUBSTR(e.CPF, 10, 2) FROM EMPREGADO e;

---9. Mostre todos os funcionários cujo nome contenha a palavra SILVA
SELECT nome FROM empregado e
WHERE nome LIKE '%SILVA%';

---10. Encontre os nomes das cidades dos empregados que trabalham para a “Volvo”
SELECT DISTINCT e.cidade FROM EMPREGADO e 
LEFT JOIN trabalha t ON t.CODE = e.CODE 
LEFT JOIN COMPANHIA c ON c.CODC = t.CODC 
WHERE c.NOME = 'VOLVO';

---11. Encontre os nomes de todos os empregados que não trabalham para a “Volvo”.
SELECT e.nome FROM EMPREGADO e 
LEFT JOIN trabalha t ON t.CODE = e.CODE 
LEFT JOIN COMPANHIA c ON c.CODC = t.CODC 
WHERE c.NOME <> 'VOLVO';

---12. Encontre os nomes das cidades dos empregados que trabalham para a “Volvo” e
---para a “Bosch” utilizando intersect.
SELECT e.nome FROM EMPREGADO e 
LEFT JOIN trabalha t ON t.CODE = e.CODE 
LEFT JOIN COMPANHIA c ON c.CODC = t.CODC 
WHERE c.NOME = 'VOLVO'
UNION 
SELECT e.nome FROM EMPREGADO e 
LEFT JOIN trabalha t ON t.CODE = e.CODE 
LEFT JOIN COMPANHIA c ON c.CODC = t.CODC 
WHERE c.NOME = 'BOSCH';

---13. Mostre os empregados com idade menor que 25 e maior que 50.
SELECT nome, age FROM (SELECT e.nome, ROUND(MONTHS_BETWEEN(sysdate, TRUNC(e.DT_NASC))/12) AS age 
FROM EMPREGADO e)
where age NOT BETWEEN 25 and 50;

---14. Mostre os empregados com idade entre 30 e 50 que morem na cidade de curitiba.
SELECT e.nome, age, e.cidade FROM (SELECT ROUND(MONTHS_BETWEEN(sysdate, TRUNC(e.DT_NASC))/12) AS age 
FROM EMPREGADO e), EMPREGADO e 
WHERE age BETWEEN 30 AND 50 AND e.CIDADE = 'CURITIBA'
ORDER BY age; 

---15. Dê um aumento de 10% a todos os empregados da “Volvo”.
UPDATE TRABALHA SET salario = salario * 1.1
WHERE codc = (SELECT c.codc FROM COMPANHIA c WHERE c.nome = UPPER('Volvo'));

---16. Dê um aumento de 10% a todos os empregados da cidade de Blumenau.
UPDATE TRABALHA t SET t.salario = t.salario * 1.1
WHERE t.code in (
	SELECT code FROM EMPREGADO e WHERE e.cidade = UPPER('Blumenau')
);

---17. Exclua todos os funcionários da falida XX Corporation e depois a exclua. Antes
---faça um backup deste dados copiando para outra tabela.

--- BACKUP COMPANHIA
CREATE VIEW xx_corp AS
	SELECT * FROM COMPANHIA c WHERE c.nome = UPPER('XX CORPORATION');

CREATE TABLE bkp_companhia as SELECT * FROM xx_corp;

--- BACKUP TRABALHA
CREATE VIEW xx_trabalha AS
	SELECT t.code, t.codc, t.salario FROM TRABALHA t 
	JOIN COMPANHIA c ON c.codc = t.codc
	WHERE c.nome = upper('XX CORPORATION');

CREATE TABLE bkp_trabalha AS SELECT * FROM xx_trabalha;

--- BACKUP EMPREGADO
CREATE VIEW xx_empregado AS
	SELECT e.code, e.nome, e.rua, e.cidade, e.cpf, e.dt_nasc, e.rg, e.mae, e.sexo FROM EMPREGADO e 
	JOIN XX_TRABALHA x ON x.code = e.code;

CREATE TABLE bkp_empregado AS SELECT * FROM xx_empregado;


DELETE FROM companhia c WHERE c.codc = (SELECT DISTINCT codc FROM BKP_TRABALHA);
DELETE FROM EMPREGADO e WHERE e.code in (SELECT DISTINCT code FROM BKP_TRABALHA);
DELETE FROM trabalha t WHERE t.codc = (SELECT DISTINCT codc FROM BKP_TRABALHA);

---18. Encontre os empregados que recebam um salário maior que a média de salários das companhias.
SELECT e.nome, t.salario FROM (
	SELECT avg(c_avg) AS t_avg FROM (
		SELECT t.codc, sum(t.salario) AS soma, avg(t.salario) AS c_avg FROM TRABALHA t
		GROUP BY t.CODC
	)
), empregado e
JOIN TRABALHA t ON t.CODE = e.CODE 
WHERE t.salario >= t_avg;


---19. Encontre os nomes, endereços e cidades de todos os empregados da “Volvo” 
---que ganham entre dez e vinte mil reais por ano.
SELECT * FROM EMPREGADO e
LEFT JOIN TRABALHA t ON t.CODE = e.CODE
LEFT JOIN COMPANHIA c ON c.CODC = t.CODC
WHERE c.NOME = UPPER('Volvo') AND t.SALARIO BETWEEN 10000 AND 20000;

---20. Encontre os nomes de todos os empregados que moram na mesma cidade da companhia que trabalham.
SELECT * FROM EMPREGADO e
LEFT JOIN TRABALHA t ON t.CODE = e.CODE
LEFT JOIN COMPANHIA c ON c.CODC = t.CODC
WHERE e.CIDADE = c.CIDADE;

---21. Encontre os nomes de todos os empregados que ganham mais que os empregados da “Bosch”.
SELECT e.nome, t.salario FROM EMPREGADO e
JOIN TRABALHA t ON e.code = t.code
JOIN COMPANHIA c ON t.codc = c.codc
WHERE t.salario > (
    SELECT max(t2.salario)
    FROM TRABALHA t2
    JOIN COMPANHIA c2 ON t2.codc = c2.codc
    WHERE c2.nome = UPPER('Bosch')
);

---22. Mostre as companhias cuja média salarial esteja entre 20.000 e 30.000 anuais.
SELECT c.NOME, avg(t.salario)*12 AS avg_anual FROM TRABALHA t
LEFT JOIN COMPANHIA c ON c.codc = t.codc
GROUP BY t.CODC, c.nome
HAVING avg(t.salario)*12 BETWEEN 20000 AND 30000;

---23. Encontre os empregados que recebam um salário maior que a média de salários da sua companhia.
SELECT e.nome FROM EMPREGADO e
LEFT JOIN TRABALHA t ON t.CODE = e.CODE 
JOIN (
	SELECT c.CODC AS cod_comp, AVG(t.SALARIO) AS avg_sal FROM TRABALHA t
	LEFT JOIN COMPANHIA c ON c.CODC = t.CODC
	GROUP BY c.CODC) ON t.CODC = cod_comp
WHERE t.SALARIO > avg_sal;

---24. Encontre as companhias cujos empregados ganham os salários mais altos em média, 
---que a média dos salários da “Volvo”.
--- (Intepretei o seguinte: Encontre as companhias cuja média salarial é maior que a média salarial da 'Volvo')
SELECT c.nome, AVG(t.salario) AS media FROM COMPANHIA c
LEFT JOIN TRABALHA t ON t.codc = c.CODC
GROUP BY c.nome
HAVING avg(t.SALARIO) > (
	SELECT avg(t.salario) FROM TRABALHA t
	JOIN COMPANHIA c ON c.CODC = t.CODC
	WHERE c.nome = UPPER('Volvo')
	group BY c.CODC
);

---25. Encontre a companhia que tenha a menor folha de pagamento e a que tenha a maior folha de pagamento.
SELECT nome_comp, folha AS folha_pagamento FROM (
	SELECT c1.nome AS nome_comp, sum(t.salario) AS folha FROM COMPANHIA c1
	LEFT JOIN TRABALHA t ON t.codc = c1.codc
	GROUP BY c1.nome
)
WHERE folha = (
	SELECT min(folha) FROM (
		SELECT c1.nome AS nome_comp, sum(t.salario) AS folha FROM COMPANHIA c1
		LEFT JOIN TRABALHA t ON t.codc = c1.codc
		GROUP BY c1.nome
	)
)
UNION
SELECT c.nome, sum(t.salario) AS folha_pagamento FROM TRABALHA t
LEFT JOIN COMPANHIA c ON c.codc = t.codc
GROUP BY c.nome
HAVING sum(t.salario) = (
	SELECT max(folha) FROM (
		SELECT t.codc AS cod_comp, sum(t.salario) AS folha FROM TRABALHA t
		GROUP BY t.codc
	)
);

---26. Encontre a companhia com a maior média salarial.
SELECT c.nome, avg(t.salario) FROM COMPANHIA c 
LEFT JOIN TRABALHA t ON t.codc = c.codc
GROUP BY c.nome
HAVING avg(t.salario) =(
	SELECT max(media_salarial) FROM (
		SELECT t.codc AS cod_comp, avg(t.salario) AS media_salarial FROM TRABALHA t
		GROUP BY t.codc
	)
);

---27. Encontre a companhia com o maior número de empregados.
SELECT nome_comp, num_emp FROM (
	SELECT c.nome nome_comp, COUNT(t.code) AS num_emp FROM TRABALHA t
	LEFT JOIN COMPANHIA c ON c.codc = t.codc
	GROUP BY c.nome
)
where num_emp = (
	SELECT max(num_emp) FROM (
		SELECT c.nome nome_comp, COUNT(t.code) AS num_emp FROM TRABALHA t
		LEFT JOIN COMPANHIA c ON c.codc = t.codc
		GROUP BY c.nome
	)
);

---28. Crie uma visão que mostre os nomes de todos os empregados que moram na mesma rua, cidade do seu gerente.
CREATE VIEW empregados_vizinhos_gerentes AS 
SELECT e.nome, e.cidade, e.rua, e2.nome AS nome_gerente FROM EMPREGADO e
LEFT JOIN GERENTE g ON g.code = e.code
INNER JOIN EMPREGADO e2 ON g.CODG = e2.code
INNER JOIN (
	SELECT DISTINCT e.nome nome_gerente_2, e.cidade AS cidade_gerente FROM gerente g
	LEFT JOIN EMPREGADO e ON e.code = g.CODG
) ON e2.nome = nome_gerente_2
WHERE e.cidade = cidade_gerente;

---29. Assuma que as companhias possam estar localizadas em diversas
---cidades. Encontre todas as companhias localizadas em todas as cidades onde haja unidades da “Bosch”.
SELECT c.nome FROM COMPANHIA c
WHERE c.cidade IN (
	SELECT c.cidade FROM COMPANHIA c
	WHERE c.nome = upper('Bosch')
) AND c.nome <> upper('Bosch');

---30. Encontre a companhia com a maior média salarial e menor média salarial.
--- (Intepretei o seguinte: Encontre as companhias com maior e menor média salarial)
CREATE VIEW avg_salario_comp AS
SELECT c.nome, avg(t.salario) AS avg_sal FROM COMPANHIA c 
LEFT JOIN TRABALHA t ON t.codc = c.codc
GROUP BY c.nome;

SELECT nome, avg_sal FROM AVG_SALARIO_COMP
WHERE avg_sal = (SELECT min(avg_sal) FROM AVG_SALARIO_COMP)
UNION
SELECT nome, avg_sal FROM AVG_SALARIO_COMP
WHERE avg_sal = (SELECT max(avg_sal) FROM AVG_SALARIO_COMP);

---31. Dê um aumento de 10% a todos os da “Volvo” exceto para os que
---ganham salário maiores que 100.000 dólares. Para os últimos dê um aumento de apenas 3%.
UPDATE TRABALHA t SET salario = (
	CASE
		WHEN t.salario < 100000 THEN t.salario * 1.03
		ELSE t.salario * 1.1
	END
) WHERE t.codc = (SELECT c.codc FROM COMPANHIA c WHERE c.nome = UPPER('Volvo'));

---32. Mostre os salários alterados em 10% caso sejam empregados da
---Bosch e em 5% caso sejam da Volvo. Mostre também os salários originais e os nomes das companhias.
SELECT c.nome, t.salario, (
	CASE
		WHEN c.nome = UPPER('Bosch') THEN t.salario * 1.1
		WHEN c.nome = UPPER('Bosch') THEN t.salario * 1.03
		ELSE t.salario
	END
) AS sal_alterado FROM TRABALHA t
LEFT JOIN COMPANHIA c ON c.codc = t.codc;

---33. Mostre a maior idade por companhia.
SELECT c.nome, max(ROUND(MONTHS_BETWEEN(sysdate, TRUNC(e.DT_NASC))/12)) maior_idade FROM EMPREGADO e
LEFT JOIN TRABALHA t ON t.code = e.code
inner JOIN COMPANHIA c ON c.codc = t.codc
GROUP BY c.nome;
