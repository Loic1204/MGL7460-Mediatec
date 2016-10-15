class User
	attr_reader :usrname
	attr_reader :adminrights

	def initialize(name, admin)
		@usrname, @adminrights = name, admin
	end
end
