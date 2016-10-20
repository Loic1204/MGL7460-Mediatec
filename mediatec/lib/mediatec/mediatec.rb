#bddusers : usrname;(admin/user)
#bddfilms : filmname;writer;date;emprunt;reservation
module Mediatec
  def self.search(name, available, filmsTab)
	#TODO retourner qq chose si bdd vide
 
	res = "TITRE | REALISATEUR | DATE\n"

	filmsTab.each do |film|
		#TODO utiliser un regex pour verifier une partie du nom
		if name.nil? || name==film.titre
			if !available || available && film.emprunt.nil?
				res << film.titre + "|" + film.realisateur + "|" + film.date + "\n"
			end
		end
	end
	return res
  end

	def self.check(user, filmsTab)
		#TODO booking?
		res=""

		filmsTab.each do |film|
			if user==film.emprunt
				res << film.titre + "\n"
			end
		end
		return res
	end

	def self.addusr(adminflag, adminname, usrname, usersTab)
		adminverified=false
		alreadythere=false

		usersTab.each do |user|
			alreadythere=true if usrname==user.usrname
			adminverified=true if adminname==user.usrname && user.adminrights=="admin"
		end

		newUser = User.new(usrname,(adminflag==true ? "admin" : "user"))
		usersTab << newUser if adminverified && !alreadythere

		return usersTab
	end

	def self.addfilm(adminname, filmname, writer, date, filmsTab, usersTab)
	#TODO A corriger 
		admin_verified=false
		already_there=false

		usersTab.each do |user|
			adminverified=true if adminname==user.usrname && user.adminrights=="admin"
		end

		filmsTab.each do |film|
			already_there=true if filmname==film.titre
		end
		
		new_film = Film.new(filmname, writer, date)
		filmsTab << new_film if !already_there

		return filmsTab	
	end
end
