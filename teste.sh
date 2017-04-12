#!/bin/bash
ruby main.rb insere treinador nome="Felipe" regiao="Johto" pokebolas=100 insignias=8
ruby main.rb lista treinador

#Nx1
ruby main.rb insere pokemon nome="Mewtwo" cp=3000 hp=280 treinador_id=8
ruby main.rb insere pokemon nome="Gengar" cp=1938 hp=179 treinador_id=8

#1x1
ruby main.rb insere pokedex numero=150 pokemon_id=27
ruby main.rb insere pokedex numero=94 pokemon_id=28

#NxN
ruby main.rb insere pokemon_tipo tipo_id=11 pokemon_id=27
ruby main.rb insere pokemon_tipo tipo_id=12 pokemon_id=27
ruby main.rb insere pokemon_tipo tipo_id=14 pokemon_id=28

ruby main.rb altera pokemon 27 cp=4000

ruby main.rb exclui pokemon id=26
ruby main.rb lista pokedex

ruby main.rb lista pokemon_tipo
ruby main.rb exclui tipo id=11
ruby main.rb lista pokemon_tipo

ruby main.rb exclui treinador nome="Felipe"
ruby main.rb lista pokemon