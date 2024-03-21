CREATE TABLE empregado(
	codE NUMBER (5),
	CPF char (11),
	RG char (9),
	nome char (200),
	rua char (200),
	cidade char (100),
	data_nasc DATE,
	mae char (200),
	sexo char (1),
	
	CONSTRAINT pk_empregado PRIMARY KEY (codE),
	CONSTRAINT uk_cpf UNIQUE (cpf),
	CONSTRAINT uk_mae_nome_nascimento UNIQUE (mae, nome, data_nasc),
	CONSTRAINT uk_rg UNIQUE (rg),
	CONSTRAINT ck_sexo CHECK (sexo IN ('M', 'F'))
);

CREATE TABLE companhia(
	codC NUMBER (5),
	nome_companhia char (200),
	cidade char (100),
	
	CONSTRAINT pk_companhia PRIMARY KEY (codC)
);

CREATE TABLE trabalha (
	codE NUMBER (5),
	codC NUMBER (5),
	salario NUMBER (6, 2),
	
	CONSTRAINT pk_trabalha PRIMARY KEY (codE, codC),
	CONSTRAINT fk_empregado FOREIGN KEY (codE) REFERENCES empregado (codE),
	CONSTRAINT fk_companhia FOREIGN KEY (codC) REFERENCES companhia (codC)
);


CREATE TABLE gerente (
	codE_gerente NUMBER (5),
	codE_empregado NUMBER (5),
	
	CONSTRAINT pk_gerente PRIMARY KEY (codE_gerente, codE_empregado),
	CONSTRAINT fk_empreago_sup FOREIGN KEY (codE_gerente) REFERENCES empregado (codE),
	CONSTRAINT fk_empregado_sub FOREIGN KEY (codE_empregado) REFERENCES empregado (codE)
);