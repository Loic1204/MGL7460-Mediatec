module FluxFilm
  def self.read(file_name)
    films = []

    flux = File.open(file_name)
    flux.readlines.map do |ligne|
      tab = ligne.delete!("\n").split(";")
      films << Film.new(tab[0],tab[1],tab[2],tab[3],tab[4])
    end
    flux.close

    return films
  end

  def self.write(file_name, films)
    flux = File.open(file_name, "w")
		
    films.each do |film|
      emprunt = (film.emprunt.nil? ? "" : film.emprunt)
      flux.puts film.titre + ";" + film.realisateur + ";" + film.date + ";" + emprunt + ";"
    end
    flux.close
  end
end
