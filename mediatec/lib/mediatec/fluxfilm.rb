module FluxFilm
	def self.read(filename)
		filmsTab = []

		flux = File.open(filename)
    	flux.readlines.map do |ligne|
			tab = ligne.delete!("\n").split(";")
			filmsTab << Film.new(tab[0],tab[1],tab[2],tab[3],tab[4])
		end
        flux.close

		return filmsTab
	end

	def self.write(filename, filmsTab)
		flux = File.open(filename, "w")
		filmsTab.each do |film|
			flux.puts film.titre + ";" + film.realisateur + ";" + film.date + ";" + film.emprunt + ";" + film.reservation
		end
        flux.close
	end
end
