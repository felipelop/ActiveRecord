require 'rubygems'
require 'active_record'
require './pokemon.rb'
require './treinador.rb'
require './tipo.rb'
require './pokedex.rb'

def iniciaPokemon()
    
    lista_pokemon = ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", 
    "Charizard", "Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod",
    "Butterfree", "Weedle", "Kakuna", "Beedril", "Pidgey", "Pidgeotto", "Pidgeot",
    "Rattata", "Raticatate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu",
    "Raichu", "Sandshrew", "Sandslash", "Nidoran Femea", "Nidorina", "Nidoqueen",
    "Nidoran Macho", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix",
    "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom",
    "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett", "Dugtrio",
    "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe",
    "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam",
    "Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel",
    "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash",
    "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetch", "Doduo", "Dodrio",
    "Seel", "Dewgong", "Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter",
    "Gengar", "Onix", "Drowzee", "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode",
    "Exeggute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Lickitung",
    "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan",
    "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime",
    "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp",
    "Gyrados", "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon",
    "Porygon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl",
    "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite",
    "Mewtwo", "Mew"]
    
	cont = 1
	lista_pokemon.each do |p|
    	treina = Treinador.find(Random.new.rand(1..7))
    	poke = Pokemon.new()
    	poke.nome = p
    	poke.treinador = treina
    	poke.hp = Random.rand(1..300)
    	poke.cp = Random.rand(1..1500)
    	po = Pokedex.new()
    	po.numero = cont
    	po.pokemon = poke
    	po.save
    	poke.save
    	cont += 1
    end
end

def iniciaTipoPokemon()
    
	pokes = Pokemon.all
    cont = 0
	pokes.each do |poke|
        tipo1 = Tipo.find(Random.new.rand(1..16))
        poke.tipos << tipo1
        if cont > 30
            tipo2 = Tipo.find(Random.new.rand(1..16))
            while tipo1 == tipo2
                tipo2 = Tipo.find(Random.new.rand(1..16))
		end
            poke.tipos << tipo2
	end
        if cont > 80
            tipo3 = Tipo.find(Random.new.rand(1..16))
            while tipo3 == tipo2 || tipo1 == tipo3
                tipo3 = Tipo.find(Random.new.rand(1..16)) 
		end
            poke.tipos << tipo3
	end
        if cont > 130
            tipo4 = Tipo.find(Random.new.rand(1..16))
            while tipo1 == tipo4 || tipo2 == tipo4 || tipo3 == tipo4
                tipo4 = Tipo.find(Random.new.rand(1..16)) 
		end
            poke.tipos << tipo4
        end
        cont += 1
	end
end

def insereTreinador()
    lista_treinador = ["Ash", "Red", "Brandom", "Gary", "Misty", "Serena", "Mew"]
    lista_regiao = ["Kanto", "Johto", "Hoenn", "Sinnoh", "Unova", "Kalos", "Alola"]
    
    i=0
    lista_treinador.each do |t|
        tre = Treinador.new()
        tre.nome = t
        tre.regiao = lista_regiao[i]
        i += 1
        tre.insignias = Random.rand(1..8)
        tre.pokebolas = Random.rand(1..100)
	    tre.save
	end
end

def insereTipo()
    lista_tipo = ["Eletrico", "Metal", "Normal", "Fogo", "Agua", "Planta",
    "Inseto", "Venenoso", "Terra", "Pedra", "Psiquico", "Voador", "Fantasma",
    "Gelo", "Fada", "Dragao" ]

    lista_tipo.each do |t|
        tip = Tipo.new()
        tip.nome = t
        tip.save
    end
end

    insereTreinador()
    insereTipo()
    iniciaPokemon()
    iniciaTipoPokemon()
