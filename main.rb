require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
					:database => "Tabelas.sqlite3"

class Pokedex < ActiveRecord::Base;
	belongs_to :pokemon
	validates_uniqueness_of :pokemon_id
end

class Pokemon < ActiveRecord::Base;
	belongs_to :treinador
	has_and_belongs_to_many :tipos, :dependent => :destroy
	has_one :pokedex, :dependent => :destroy
end

class Tipo < ActiveRecord::Base;
	has_and_belongs_to_many :pokemons, :dependent => :destroy
end

class Treinador < ActiveRecord::Base;
	has_many :pokemons, :dependent => :destroy
end

class TipoPokemon < ActiveRecord::Base;
    self.table_name = "pokemons_tipos"
    belongs_to :pokemon
    belongs_to :tipo
end

#Cria uma Hash com os argumentos passados separando eles por = e criando o =>
def argumentos(args)
	hash = Hash.new
	args.each do |arg|  
		hash[arg.split('=').first] = arg.split('=').second
	end  
	return hash
end
	

def insere()
	case ARGV.second
	when 'pokemon'
		hash = argumentos(ARGV[2..-1])
		pokemon = Pokemon.new(hash)
		pokemon.save
		puts "Insirido:"
		p pokemon
	when 'pokedex'
		hash = argumentos(ARGV[2..-1])
		pokedex = Pokedex.new(hash)
		pokedex.save
		puts "Insirido:"
		p pokedex
	when 'tipo'
		hash = argumentos(ARGV[2..-1])
		tipo = Tipo.new(hash)
		tipo.save
		puts "Insirido:"
		p tipo
	when 'treinador'
		hash = argumentos(ARGV[2..-1])
		treinador = Treinador.new(hash)
		treinador.save
		puts "Insirido:"
		p treinador
	when 'pokemon_tipo'
		hash = argumentos(ARGV[2..-1])
		tipoPokemon = TipoPokemon.new(hash)
		tipoPokemon.save
		puts "Insirido:"
		p tipoPokemon
	else
		puts "Tabela não existe"
	end
end

def exclui()
	case ARGV.second
	when 'pokemon'
		hash = argumentos(ARGV[2..-1])
		pokemons = Pokemon.where(hash)
		puts "Excluido:"
		pokemons.each do |pokemon|
			p pokemon
			pokemon.destroy()
		end
	when 'pokedex'
		hash = argumentos(ARGV[2..-1])
		pokedexes = Pokedex.where(hash)
		puts "Excluido:"
		pokedexes.each do |pokedex|
			p pokedex
			pokedex.destroy()
		end
	when 'tipo'
		hash = argumentos(ARGV[2..-1])
		tipos = Tipo.where(hash)
		puts "Excluido:"
		tipos.each do |tipo|
			p tipo
			tipo.destroy()
		end
	when 'treinador'
		hash = argumentos(ARGV[2..-1])
		treinadores = Treinador.where(hash)
		puts "Excluido:"
		treinadores.each do |treinador|
			p treinador
			treinador.destroy()
		end
	when 'pokemon_tipo'
		hash = argumentos(ARGV[2..-1])
		tipoPokemons = TipoPokemon.where(hash)
		puts "Excluido:"
		tipoPokemons.each do |tipoPokemon|
			p tipoPokemon
			tipoPokemon.destroy()
		end
	else
		puts "Tabela não existe"
	end
end

def altera()
	#toda alteração precisa do id da linha que deseja alterar
	case ARGV.second
	when 'pokemon'
		puts "Antes da alteração"
		pokemon = Pokemon.find(ARGV[2])
		p pokemon
		Pokemon.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
		puts "Depois da alteração"
		pokemon = Pokemon.find(ARGV[2])
		p pokemon
	when 'tipo'
		puts "Antes da alteração"
		tipo = Tipo.find(ARGV[2])
		p tipo
		Tipo.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
		puts "Depois da alteração"
		tipo = Tipo.find(ARGV[2])
		p tipo
	when 'pokedex'
		puts "Antes da alteração"
		pokedex = Pokedex.find(ARGV[2])
		p pokedex
		Pokedex.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
		puts "Depois da alteração"
		pokedex = Pokedex.find(ARGV[2])
		p pokedex
	when 'treinador'
		puts "Antes da alteração"
		treinador = Treinador.find(ARGV[2])
		p treinador
		Treinador.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
		puts "Depois da alteração"
		treinador = Treinador.find(ARGV[2])
		p treinador
	else
		puts "Tabela não existe"
	end
end

def lista()
	puts "Listagem dos elementos:"
	case ARGV.second
	when 'pokemon'
		pokemons = Pokemon.all
		pokemons.each do |pokemon|
			p pokemon
		end
	when 'pokedex'
		pokedexes = Pokedex.all
		pokedexes.each do |pokedex|
			p pokedex
		end
	when 'tipo'
		tipos = Tipo.all
		tipos.each do |tipo|
			p tipo
		end
	when 'treinador'
		treinadores = Treinador.all
		treinadores.each do |treinador|
			p treinador
		end
	when 'pokemon_tipo'
		tipoPokemons = TipoPokemon.all
		tipoPokemons.each do |tipoPokemon|
			p tipoPokemon
		end
	else
		puts "Tabela não existe"
	end
end

case ARGV.first
when 'insere'
	insere()
when 'exclui'
	exclui()
when 'altera'
	altera()
when 'lista'
	lista()
when 'inicia'
    puts "Criando elementos"
else
	puts "Argumentos invalidos"
end	