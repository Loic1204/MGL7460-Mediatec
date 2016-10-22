module FluxUser
	def self.read(file_name)
		users_tab = []

		flux = File.open(file_name)
    	flux.readlines.map do |ligne|
			tab = ligne.delete!("\n").split(";")
			users_tab << User.new(tab[0],tab[1])
		end
        flux.close

		return users_tab
	end

	def self.write(file_name, users_tab)
		flux = File.open(file_name, "w")
		users_tab.each do |user|
			flux.puts user.usrname + ";" + user.admin_rights
		end
        flux.close
	end
end
