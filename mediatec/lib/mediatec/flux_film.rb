module FluxFilm
  def self.read(file_name)
    films = []

    flux = File.open(file_name)
    flux.readlines.each do |ligne|
      titre, realisateur, date, emprunt, reservation = ligne.delete("\n").split(";")
      films << Film.new(titre, realisateur, date, emprunt, reservation)
    end
    flux.close

    films
  end

  def self.write(file_name, films)
    flux = File.open(file_name, "w")
		
    films.each do |film|
      emprunt = (film.emprunt.nil? ? "" : film.emprunt)
      reservation = (film.reservation.nil? ? "" : film.reservation)
      flux.puts film.titre + ";" + film.realisateur + ";" + film.date + ";" + emprunt + ";" + reservation
    end
    flux.close
  end
end
