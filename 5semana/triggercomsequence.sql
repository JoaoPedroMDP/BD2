DROP TABLE curso; -- Se já existir

CREATE TABLE curso(
	codC NUMBER (5),
	name varchar2(50)
);
INSERT INTO curso (codC, name) VALUES (1, 'TADS');

-- 1 Verificar tabela
SELECT max(codC) FROM curso; -- É '1'

DROP SEQUENCE sqCodCurso; -- Se já existir
CREATE SEQUENCE sqCodCurso START WITH 2 INCREMENT BY 1;

 SELECT trigger_name FROM user_triggers
DROP TRIGGER TGCURSOCOMSEQUENCE
CREATE OR REPLACE TRIGGER tgCursoComSequence
	BEFORE UPDATE OR INSERT ON curso
	FOR EACH ROW
	DECLARE 
		novo_cod NUMBER (5);
BEGIN
	IF inserting THEN
		SELECT sqCodCurso.nextval INTO novo_cod FROM dual;
		:NEW.codC := novo_cod;
		:NEW.name := upper(:NEW.name);
	ELSE
		:NEW.name := upper(:NEW.name);
	END IF;
END
	

INSERT INTO curso (name) VALUES ('bcc');