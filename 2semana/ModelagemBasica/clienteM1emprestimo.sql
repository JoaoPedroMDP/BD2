CREATE TABLE emprestimo(
	valor number(9),
	num number(20),
	CONSTRAINT pkemprestimo PRIMARY KEY (num)
);

CREATE TABLE cliente(
	nome varchar(50),
	tel varchar(13),
	cpf varchar(11),
	endereco varchar(100),
	cep varchar(8),
	numE number(20),
	CONSTRAINT pkcliente PRIMARY KEY (cpf),
	CONSTRAINT fkempresitmo FOREIGN KEY (numE) REFERENCES emprestimo(num)
);
