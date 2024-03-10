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
	CONSTRAINT pkcliente PRIMARY KEY (cpf)
);

CREATE TABLE clienteEmprestimo(
	cpfC varchar(11),
	numE number(20),
	CONSTRAINT pkpivot PRIMARY KEY (cpfC, numE),
	CONSTRAINT fkcliente FOREIGN KEY (cpfC) REFERENCES cliente(cpf),
	CONSTRAINT fkemprestimo FOREIGN KEY (numE) REFERENCES emprestimo(num)
);