require "active_record"

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
					:database => "Tabelas.sqlite3"

class Treinador < ActiveRecord::Base;
	has_many :pokemons
end
