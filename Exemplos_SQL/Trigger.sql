-- Tabela para o exemplo
CREATE TABLE curso (
    codC NUMBER(5),
    name VARCHAR2(50)
);

-- Definimos o nome do Trigger
CREATE OR REPLACE TRIGGER tgCursoComSequence
	-- Definimos o momento em que o Trigger será executado (BEFORE ou AFTER)
	-- E quais operações ele irá monitorar (UPDATE, INSERT, DELETE)
	BEFORE UPDATE OR INSERT ON curso
	-- Aqui estou falando que o trigger será executado para cada linha afetada pela operação
	-- Se eu não colocar isso, o trigger será executado apenas uma vez para a operação inteira
	FOR EACH ROW
	-- Aqui vou declarar as variáveis. Elas são declaradas da da mesma maneira que você declara as colunas de uma tabela
	DECLARE 
		novo_cod NUMBER (5);
	-- Agora sim vamos começar o corpo do Trigger
BEGIN
	-- Daqui até o END é o que o Trigger vai fazer. Isso varia de acordo com o que você quer fazer
	IF inserting THEN
		SELECT sqCodCurso.nextval INTO novo_cod FROM dual;
		:NEW.codC := novo_cod;
		:NEW.name := upper(:NEW.name);
	ELSE
		:NEW.name := upper(:NEW.name);
	END IF;
	-- Aqui termina o corpo do Trigger
END