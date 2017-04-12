Aluno: Felipe Lopes Pereira
GRR20153190
Disciplina: Desenvolvimento Web
Professor: Bruno Muller

 Esse projeto foi realizado baseado no universo Pokemon para a criação de um 
banco de dados relacional em Ruby. As relações são:
- Pokemon| 1x1 |Número na Pokedex
- Pokemon| Nx1 |Treinador
- Pokemon| NxN |Tipo do Pokemon

 Execute o Makefile para a geração do banco de dados (criaTudo.rb) e também para
o preenchimento do mesmo banco (preencheBanco.rb). Se for preciso, começar
usando o banco de dados vazio crie rodando apenas o arquivo criaTudo.rb.

 Após a criação do banco, execute o main.rb para realizar as interações nas
tabelas. Deve ser utilizado como especificado:

ruby main.rb <Operação> <Tabela> <Atributos>

- "Operação" é: insere, exclui, lista, altera.
- "Tabela" é: pokemon, tipo, treinador, pokedex, pokemon_tipo.
- "Atributos": campos das tabelas.

 Existe um executável teste.sh que possui exemplos de comandos que podem ser
utilizados. Esse executável, foi criado justamente para avaliação. Porém deve
ser alterado para testes mais apropriados se for necessário