CREATE TABLE empregado(
	codE NUMBER (5),
	nome varchar2 (200),
	rua varchar2 (200),
	cidade varchar2 (100),
	CPF varchar2 (11),
	dt_nasc DATE,
	RG varchar2 (9),
	mae varchar2 (200),
	sexo char (1),
	
	CONSTRAINT pk_empregado PRIMARY KEY (codE),
	CONSTRAINT uk_cpf UNIQUE (cpf),
	CONSTRAINT uk_mae_nome_nascimento UNIQUE (mae, nome, dt_nasc),
	CONSTRAINT uk_rg UNIQUE (rg),
	CONSTRAINT ck_sexo CHECK (sexo IN ('M', 'F'))
);

CREATE TABLE companhia(
	codC NUMBER (5),
	nome varchar2 (200),
	cidade varchar2 (100),
	
	CONSTRAINT pk_companhia PRIMARY KEY (codC)
);

CREATE TABLE trabalha (
	codE NUMBER (5),
	codC NUMBER (5),
	salario NUMBER (15, 3),
	
	CONSTRAINT pk_trabalha PRIMARY KEY (codE, codC),
	CONSTRAINT fk_empregado FOREIGN KEY (codE) REFERENCES empregado (codE),
	CONSTRAINT fk_companhia FOREIGN KEY (codC) REFERENCES companhia (codC)
);

CREATE TABLE gerente (
	codG NUMBER (5),
	codE NUMBER (5),
	
	CONSTRAINT pk_gerente PRIMARY KEY (codG, codE),
	CONSTRAINT fk_empregado_ger FOREIGN KEY (codG) REFERENCES empregado (codE),
	CONSTRAINT fk_empregado_emp FOREIGN KEY (codE) REFERENCES empregado (codE)
);