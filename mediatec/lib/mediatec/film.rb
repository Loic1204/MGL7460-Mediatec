class Film
	attr_reader :titre
	attr_reader :realisateur
	attr_reader :date
	
	def initialize (titre, realisateur, date)
		@titre, @realisateur, @date = titre, realisateur, date
	end
end
