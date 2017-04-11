require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
					:database => "Tabelas.sqlite3"

class Pokedex < ActiveRecord::Base;
	belongs_to :pokemon
end

class Pokemon < ActiveRecord::Base;
	belongs_to :treinador
	has_and_belongs_to_many :tipos
	has_one :pokedex, :dependent => :destroy
end

class Tipo < ActiveRecord::Base;
	has_and_belongs_to_many :pokemons
end

class Treinador < ActiveRecord::Base;
	has_many :pokemons, :dependent => :destroy
end

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
	when 'pokedex'
		hash = argumentos(ARGV[2..-1])
		pokedex = Pokedex.new(hash)
		pokedex.save
	when 'tipo'
		hash = argumentos(ARGV[2..-1])
		tipo = Tipo.new(hash)
		tipo.save
	when 'treinador'
		hash = argumentos(ARGV[2..-1])
		treinador = Treinador.new(hash)
		treinador.save
	else
		puts "Tabela não existe"
	end
end

def exclui()
	case ARGV.second
	when 'pokemon'
		hash = argumentos(ARGV[2..-1])
		pokemons = Pokemon.where(hash)
		pokemons.each do |pokemon|
			pokemon.destroy()
		end
	when 'pokedex'
		hash = argumentos(ARGV[2..-1])
		pokedexes = Pokedex.where(hash)
		pokedexes.each do |pokedex|
			pokedex.destroy()
		end
	when 'tipo'
		hash = argumentos(ARGV[2..-1])
		tipos = Tipos.where(hash)
		tipos.each do |tipo|
			tipo.destroy()
		end
	when 'treinador'
		hash = argumentos(ARGV[2..-1])
		treinadores = Treinador.where(hash)
		treinadores.each do |treinador|
			treinador.destroy()
		end
	else
		puts "Tabela não existe"
	end
end

def altera()
	case ARGV.second
	when 'pokemon'
		Pokemon.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
	when 'tipo'
		Tipo.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
	when 'pokedex'
		Pokedex.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
	when 'treinador'
		Treinador.find(ARGV[2]).update(argumentos(ARGV[3..-1]))
	else
		puts "Tabela não existe"
	end
end

def lista()
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