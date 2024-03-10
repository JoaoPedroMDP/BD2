CREATE TABLE cliente(
	nome varchar(50),
	tel varchar(13),
	cpf varchar(11),
	endereco varchar(100),
	cep varchar(8),
	CONSTRAINT pkcliente PRIMARY KEY (cpf)
);

CREATE TABLE emprestimo(
	valor number(9),
	num number(20),
	cpfC varchar(8),
	CONSTRAINT pkemprestimo PRIMARY KEY (num),
	CONSTRAINT fkcliente FOREIGN KEY (cpfC) REFERENCES cliente(cpf)
);