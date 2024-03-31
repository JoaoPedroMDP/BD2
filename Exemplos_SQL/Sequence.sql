CREATE SEQUENCE sqCodCurso START WITH 1 INCREMENT BY 1;

-- Para pegar o próximo valor da sequência quando precisar:
SELECT sqCodCurso.nextval FROM dual;
-- Esse 'dual' é uma tabela do Oracle que serve para fazer operações simples. 
-- Não tem nada nela, está lá só pra podermos completar a sintaxe do SELECT.
-- Resumindo: gambiarra da Oracle, nem esquente com isso.
