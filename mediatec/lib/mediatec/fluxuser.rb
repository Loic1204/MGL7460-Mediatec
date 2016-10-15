module FluxUser
	def self.read(filename)
		usersTab = []

		flux = File.open(filename)
    	flux.readlines.map do |ligne|
			tab = ligne.delete!("\n").split(";")
			usersTab << User.new(tab[0],tab[1])
		end
        flux.close

		return usersTab
	end

	def self.write(filename, usersTab)
		flux = File.open(filename, "w")
		usersTab.each do |user|
			flux.puts user.usrname + ";" + user.adminrights
		end
        flux.close
	end
end
