-- Tabela simples
CREATE TABLE curso(
    codC NUMBER (5),
    name varchar2(50)
);

CREATE TABLE aluno(
    codA NUMBER (5),
    name varchar2(50)
);

-- Tabela com chave primária
CREATE TABLE curso(
    codC NUMBER (5),
    name varchar2(50),
    CONSTRAINT pk_curso PRIMARY KEY (codC)
);

CREATE TABLE aluno(
    codA NUMBER (5),
    name varchar2(50),
    CONSTRAINT pk_aluno PRIMARY KEY (codA)
);

-- Tabela com chave estrangeira (nesse exemplo, um aluno aponta para qual curso ele está fazendo)
CREATE TABLE curso(
    codC NUMBER (5),
    name varchar2(50),
    CONSTRAINT pk_curso PRIMARY KEY (codC)
);

CREATE TABLE aluno(
    codA NUMBER (5),
    name varchar2(50),
    codC NUMBER (5),
    CONSTRAINT pk_aluno PRIMARY KEY (codA),
    CONSTRAINT fk_curso FOREIGN KEY (codC) REFERENCES curso(codC)
);

-- Tabela com CHECK
CREATE TABLE aluno(
    codA number (5),
    sexo char(1),
    CONSTRAINT ck_sexo_aluno CHECK (sexo IN ('M', 'F'))
);

-- Tabela com UNIQUE
CREATE TABLE aluno(
    codA number (5),
    cpf varchar2(11),
    CONSTRAINT uk_cpf_aluno UNIQUE (cpf)
);