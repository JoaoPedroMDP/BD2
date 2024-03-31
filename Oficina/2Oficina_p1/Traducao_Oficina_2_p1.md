Uma das piores definições de exercício até o momento. Foi difícil decifrar, me senti um arqueólogo depois que entendi.

Dado o banco de dados a seguir, responda o que se pede:

Empregado(codE, nome, rua, cidade, data_nasc, CPF, RG, mae, sexo)
- Primary key: codE
- Unique keys: CPF, (mae + nome + data_nasc), rg
- Checks: sexo ('m' ou 'f')


Trabalha(salario)
- Primary key: É uma chave composta pelas duas chaves estrangeiras (uma para empregado e outra para companhia)


Companhia(codC, nome_companhia, cidade)
- Primary key: codC

Gerente:
- Primary key: É uma chave composta pelas duas chaves estrangeiras que apontam para a tabela Empregado
Uma delas representa o empregado superior, e a outra, o inferior.


1. Fazer o DER e o DR (lembrando: DER é o diagrama das formas geométricas. DR é o diagrama das tabelinhas)
2. Fazer os scripts DDL (SQL)