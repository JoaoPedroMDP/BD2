CREATE TABLE funcionario(
	cod number(5),
	nome varchar(100),
	telefone varchar(25),
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

CREATE TABLE administrador(
	cod_func NUMBER (5),
	cod_depto number(5),

	he varchar (100),
	hs varchar (100),
	CONSTRAINT pk_admin PRIMARY KEY (cod_func),
	CONSTRAINT fk_func_admin FOREIGN KEY (cod_func) REFERENCES funcionario (cod),
	CONSTRAINT fk_depto FOREIGN KEY (cod_depto) REFERENCES departamento (cod)
);

CREATE TABLE agenda(
	cod_func NUMBER (5),
	placa_carro varchar (7),
	marca varchar (50),
	km_saida NUMBER (9),
	km_chegada NUMBER (9),
	data_saida DATE,
	data_chegada DATE,
	
	CONSTRAINT pk_agenda PRIMARY KEY (cod_func, placa_carro),
	CONSTRAINT fk_func_agenda FOREIGN KEY (cod_func) REFERENCES administrador (cod_func),
	CONSTRAINT fk_carro FOREIGN KEY (placa_carro) REFERENCES carro (placa)
);


CREATE TABLE producao(
	cod_func NUMBER (5),
	maquina varchar (200),
	
	CONSTRAINT pk_prod PRIMARY KEY (cod_func),
	CONSTRAINT fk_func_producao FOREIGN KEY (cod_func) REFERENCES funcionario (cod)
);

CREATE TABLE lote(
	cod_func NUMBER (5),
	cod_peca NUMBER (5),
	
	quantidade NUMBER (10),
	data_producao DATE,
	
	CONSTRAINT pk_lote PRIMARY KEY (cod_func, cod_peca),
	CONSTRAINT fk_prod_lote FOREIGN KEY (cod_func) REFERENCES producao (cod_func),
	CONSTRAINT fk_peca FOREIGN KEY (cod_peca) REFERENCES peca (cod)
);

CREATE TABLE compra(
	cod_func NUMBER (5),
	cod_peca NUMBER (5),

	cod_cliente NUMBER (5),
	
	quantidade NUMBER (10),
	data_compra DATE,
	
	CONSTRAINT pk_compra PRIMARY KEY (cod_func, cod_peca, cod_cliente),
	CONSTRAINT fk_lote FOREIGN KEY (cod_func, cod_peca) REFERENCES lote (cod_func, cod_peca),
	CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES cliente(cod)
);