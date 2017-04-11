all:
	ruby criaTudo.rb
	ruby preencheBanco.rb

clean:
	rm Tabelas.sqlite3
