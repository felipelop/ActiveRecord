require "rubygems"
require "active_record"

ActiveRecord::Base.establish_connection :adapter => "sqlite3",	
								:database => "Tabelas.sqlite3"
								
ActiveRecord::Base.connection.create_table :treinadors do |t|
	t.string :nome
	t.string :regiao
	t.integer :pokebolas
	t.integer :insignias
end

ActiveRecord::Base.connection.create_table :tipos do |t|
	t.string :nome
end

ActiveRecord::Base.connection.create_table :pokedexes do |t|
	t.integer :numero
	t.references :pokemon, foreign_key: true
end

ActiveRecord::Base.connection.create_table :pokemons do |t|
	t.string :nome
	t.integer :cp, limit: 4
	t.integer :hp, limit: 3
	t.belongs_to :treinador, foreign_key: true
end

ActiveRecord::Base.connection.create_table :pokemons_tipos, id: false do |t|
	t.references :tipo
	t.references :pokemon
end
