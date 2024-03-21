[Esse vídeo é bom](https://youtu.be/-TEm0FUL0vU?si=YiU8o2muJCl-oXHZ)

Mas, resumindo: usa-se agregação quando um conjunto de entidades e relacionamentos tem um significado importante no modelo, e deseja-se vincular uma nova tabela a esse conjunto. Para resolver isso, coloca-se na nova tabela uma chave primária de cada outra tabela dentro desse conjunto, formando uma mega-chave estrangeira.

Isso ainda é confuso pois, na minha opinião, é errado criar nomes para situações específicas que poderiam ser tratadas de maneira comum. Quer um exemplo do que estou falando?

Suponha as tabelas apresentadas no vídeo do Youtube: Pessoa, Universidade e Professor.
Nesse esquema, podemos armazenar várias universidades, vários professores e várias pessoas.

Agora queremos armazenar no sistemas as orientações que os professores dão aos alunos.
Um professor pode orientar vários alunos. Um aluno pode ser orientado por vários professores.
Bum: tabela pivô. Beleza, até aí já sabemos fazer.
Vamos colocar uma tabela 'Orienta' no sistema. Ok, mas e como vamos ligar um professor com um aluno? Não existe a tabela 'Aluno' no sistema. E agora?

-.-.-.-barulho de cérebro de programador buscando uma solução-.-.-.-
Ah! É só colocarmos na nova tabela pivô 'Orienta' uma FK pra 'Pessoa', pra 'Universidade' e pra 'Professor'.
Simples, certo? Pois é. Resolveram DAR UM NOME pra um processo tão simples, que é 'Agregação'.


Nomes são bons, mas muitas vezes fazem a gente esperar algo mais complexo.