require 'active_record'
require './pokemon.rb'
require './treinador.rb'
require './tipo.rb'
require './pokedex.rb'

def insere()
	case ARGV.second
	when 'pokemon'
		hash = Array.new()
		args = ARGV[2..-1]
		args.each do |arg|
			hash = arg
		end
		poke = Pokemon.new(hash)
		poke.save
	end
end

def exclui()

end

def altera()

end

def lista()

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
else
	puts "Argumentos invalidos"
end	