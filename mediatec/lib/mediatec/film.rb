class Film
  attr_reader :titre
  attr_reader :realisateur
  attr_reader :date
  attr_accessor :emprunt
  attr_accessor :reservation
	
  def initialize (titre, realisateur, date, emprunt, reservation)
    @titre, @realisateur, @date, @emprunt, @reservation = titre, realisateur, date, emprunt, reservation
  end

  def ==(film)
    self.titre == film.titre && self.realisateur == film.realisateur && self.date == film.date && self.emprunt == film.emprunt && self.reservation == film.reservation
  end
end
