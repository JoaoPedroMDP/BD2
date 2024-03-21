Para criar uma coluna unique, é só adicionar a seguinte constraint:

`CONSTRAINT uk_foobar UNIQUE (nome_coluna)`

Mas você vai notar que na Oficina tem uma parte que diz que as colunas (mae + nome + data_nasc) deve ser únicas.
Cuidado ao interpretar essa afirmação: ela quer dizer que essas colunas devem ser única em conjunto. Exemplo

`CONSTRAINT uk_foobar UNIQUE (mae, nome, data_nasc)`


Mae: Godofreda, nome: Robesvaldo, data_nasc: 13/03/2000
Mae: Godofreda, nome: Irrinhaldo, data_nasc: 13/03/2000

Essas duas entradas NÃO conflitam, pois embora seja a mesma mãe e a mesma data de nascimento (ownt são gêmeos), o nome é diferente.
Poderíamos dizer de forma _ilegal e criminosa_ que essas 3 colunas são unidas numa coisa só, e a regra UNIQUE é aplicada a essa _coisa_


Agora, se você deseja que essas 3 colunas sejam únicas INDIVIDUALMENTE, terá de criar 3 cosntraints separadas

`CONSTRAINT uk_mae UNIQUE (mae)`
`CONSTRAINT uk_nome UNIQUE (nome)`
`CONSTRAINT uk_data_nasc UNIQUE (data_nasc)`

RESUMINDO: A unicidade pode ser EM CONJUNTO ou INDIVIDUAL. Atente-se a isso ;D