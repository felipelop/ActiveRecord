require "active_record"

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
					:database => "Tabelas.sqlite3"

class Pokemon < ActiveRecord::Base;
	belongs_to :treinador
	has_and_belongs_to_many :tipos
	has_one :pokedex
end
