require "active_record"

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
					:database => "Tabelas.sqlite3"

class Pokedex < ActiveRecord::Base;
	belongs_to :pokemon
end
