CREATE TABLE funcionario(
	cod number(5),
	nome varchar(100),
	telefone varchar(25)
	CONSTRAINT pk_func PRIMARY KEY (cod)
);


CREATE TABLE departamento(
	cod number(5),
	nome varchar(100),
	CONSTRAINT pk_dept PRIMARY KEY (cod)
);


CREATE TABLE carro(
	placa varchar(7),
	marca varchar(100),
	CONSTRAINT pk_carro PRIMARY KEY (placa)
);


CREATE TABLE peca(
	cod number(5),
	nome varchar(100),
	CONSTRAINT pk_peca PRIMARY KEY (cod)
);


CREATE TABLE cliente(
	cod number(5),
	nome varchar(100),
	CONSTRAINT pk_cli PRIMARY KEY (cod)
);


CREATE TABLE dependente(
	cod_func NUMBER (5),
	data_nasc DATE,
	sexo varchar(1),
	nome varchar(200),
	CONSTRAINT pk_dependente PRIMARY KEY (cod_func, nome),
	CONSTRAINT fk_func FOREIGN KEY (cod_func) REFERENCES funcionario (cod)
);

CREATE TABLE administrador();
CREATE TABLE agenda();

CREATE TABLE producao();
CREATE TABLE lote();
CREATE TABLE compra();