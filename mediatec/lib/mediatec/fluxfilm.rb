module FluxFilm
	def self.read(file_name)
		films_tab = []

		flux = File.open(file_name)
    	flux.readlines.map do |ligne|
			tab = ligne.delete!("\n").split(";")
			films_tab << Film.new(tab[0],tab[1],tab[2],tab[3],tab[4])
		end
        flux.close

		return films_tab
	end

	def self.write(file_name, films_tab)
		flux = File.open(file_name, "w")
		films_tab.each do |film|
			flux.puts film.titre + ";" + film.realisateur + ";" + film.date + ";" + film.emprunt + ";" + film.reservation
		end
        flux.close
	end
end
