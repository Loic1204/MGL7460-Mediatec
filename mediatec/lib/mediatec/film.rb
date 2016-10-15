class Film
	attr_reader :titre
	attr_reader :realisateur
	attr_reader :date
	attr_reader :emprunt
	attr_reader :reservation
	
	def initialize (titre, realisateur, date, emprunt, reservation)
		@titre, @realisateur, @date, @emprunt, @reservation = titre, realisateur, date, emprunt, reservation
	end
end
