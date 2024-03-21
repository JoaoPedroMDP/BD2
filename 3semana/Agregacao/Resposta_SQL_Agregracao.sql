CREATE TABLE instituicao(
	cod NUMBER (5),
	nome varchar(200),
	CONSTRAINT pk_inst PRIMARY KEY (cod)
);

CREATE TABLE habilitacao(
	cod NUMBER (5),
	nome varchar(200),
	grau varchar(100),
	natureza varchar(100),
	CONSTRAINT pk_habi PRIMARY KEY (cod)
);

CREATE TABLE treinamento(
	cod NUMBER (5),
	nome varchar(200),
	CONSTRAINT pk_trei PRIMARY KEY (cod)
);

CREATE TABLE empresa(
	cod NUMBER (5),
	nome varchar(100),
	CONSTRAINT pk_empr PRIMARY KEY (cod)
);

CREATE TABLE egresso(
	cod NUMBER (5),
	nome varchar(100),
	email varchar(100),
	ramo_atividade varchar(100),
	naturalidade varchar(100),
	fora_area NUMBER (1),
	CONSTRAINT pk_egresso PRIMARY KEY (cod)
);


CREATE TABLE curso(
	cod_inst NUMBER (5),
	cod_habil NUMBER (5),
	CONSTRAINT pk_curso PRIMARY KEY (cod_inst, cod_habil),
	CONSTRAINT fk_inst FOREIGN KEY (cod_inst) REFERENCES instituicao (cod),
	CONSTRAINT fk_habil FOREIGN KEY (cod_habil) REFERENCES habilitacao (cod)
);

CREATE TABLE cursou(
	cod_inst NUMBER (5),
	cod_habil NUMBER (5),
	
	cod_egresso NUMBER (5),
	trabalhou NUMBER (1),
	turno varchar (15),
	data_inicio DATE,
	data_fim DATE,
	CONSTRAINT pk_cursou PRIMARY KEY (cod_inst, cod_habil, cod_egresso),
	CONSTRAINT fk_curso FOREIGN KEY (cod_inst, cod_habil) REFERENCES curso (cod_inst, cod_habil),
	CONSTRAINT fk_egresso FOREIGN KEY (cod_egresso) REFERENCES egresso (cod)
);

CREATE TABLE trabalha(
	cod_empresa NUMBER (5),
	cod_egresso NUMBER (5),
	data_ingresso DATE,
	cargo varchar (100),
	CONSTRAINT pk_trabalha PRIMARY KEY (cod_empresa, cod_egresso),
	CONSTRAINT fk_empresa FOREIGN KEY (cod_empresa) REFERENCES empresa (cod),
	CONSTRAINT fk_egresso_tr FOREIGN KEY (cod_egresso) REFERENCES egresso(cod)
);

CREATE TABLE treina(
	cod_empresa NUMBER (5),
	cod_egresso NUMBER (5),
	
	cod_treinamento NUMBER (5),
	data_inicio DATE,
	data_fim DATE,
	CONSTRAINT pk_treina PRIMARY KEY (cod_empresa, cod_egresso, cod_treinamento),
	CONSTRAINT fk_trabalhador 
		FOREIGN KEY (cod_egresso, cod_empresa) 
		REFERENCES trabalha (cod_empresa, cod_egresso),
	CONSTRAINT fk_treinamento FOREIGN KEY (cod_treinamento) REFERENCES treinamento (cod)
);



