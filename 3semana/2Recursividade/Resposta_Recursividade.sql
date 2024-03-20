
CREATE TABLE pessoa(
	cpf varchar(11),
	cod number(5),
	nome varchar(100),
	rg varchar(20),
	nasc DATE,
	cidade varchar(100),
	cpf_pai varchar(11),
	CONSTRAINT pk_pessoa PRIMARY KEY (cpf),
	CONSTRAINT fk_pai FOREIGN KEY(cpf_pai) REFERENCES pessoa(cpf)
);


INSERT INTO pessoa (cpf, cod, nome, rg, nasc, cidade) VALUES ('123456789', 1, 'Hugo Icaro', '456123789852', '15-OCT-1978', 'São Paulo');
INSERT INTO pessoa (cpf, cod, nome, rg, nasc, cidade, cpf_pai) VALUES ('654851951', 2, 'João Pedro Martins', '456852197535', '13-MAR-2000', 'Maringá', '123456789');