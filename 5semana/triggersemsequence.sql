CREATE TABLE curso(
	codC NUMBER (5),
	name varchar2(50)
);

CREATE OR REPLACE TRIGGER tgCurso
	BEFORE INSERT OR UPDATE ON curso
	FOR EACH ROW
	DECLARE 
		novo_cod NUMBER (5);
	BEGIN 
		IF inserting THEN 
			SELECT max(codC) + 1 INTO novo_cod FROM curso
			:NEW.codC: = novo_cod;
			:NEW.name: = (upper(:NEW.name:))
		ELSE
			:NEW.name: = (upper(:NEW.name:))
		END IF
	END;


INSERT INTO curso (name) VALUES ('TADS');

DROP TRIGGER tgCurso;

INSERT INTO curso (codC, name) VALUES (1, 'TADS');

SELECT trigger_name FROM user_triggers;
SELECT max(codC) + 1 FROM curso;

CREATE OR REPLACE TRIGGER tgCurso
	BEFORE INSERT OR UPDATE ON curso
	FOR EACH ROW
	DECLARE 
		novo_cod NUMBER (5);
	BEGIN 
		IF inserting THEN 
			SELECT max(codC) + 1 INTO novo_cod FROM curso;
		    :NEW.name:= upper(:NEW.name);
			:NEW.codC:= novo_cod;
			
		ELSE
			:NEW.name:= upper(:NEW.name);
		END IF;
	END;

INSERT INTO curso (name) VALUES ('bcc');
