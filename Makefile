all:
	ruby criaTudo.rb
	ruby preencheBanco.rb inicia

clean:
	rm Tabelas.sqlite3
