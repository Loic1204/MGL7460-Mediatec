#bddusers : usrname;(admin/user)
#bddfilms : film_name;writer;date;emprunt;reservation
module Mediatec
  def self.search(name, available, films_tab)
	#TODO retourner qq chose si bdd vide
 
	res = "TITRE | REALISATEUR | DATE\n"

	films_tab.each do |film|
		#TODO utiliser un regex pour verifier une partie du nom
		if name.nil? || name==film.titre
			if !available || available && film.emprunt.nil?
				res << film.titre + "|" + film.realisateur + "|" + film.date + "\n"
			end
		end
	end
	return res
  end

	def self.check(user, films_tab)
		#TODO booking?
		res=""

		films_tab.each do |film|
			if user==film.emprunt
				res << film.titre + "\n"
			end
		end
		return res
	end

	def self.add_usr(admin_flag, admin_name, usrname, users_tab)
		admin_verified=false
		already_there=false

		users_tab.each do |user|
			already_there=true if usrname==user.usrname
			admin_verified=true if admin_name==user.usrname && user.admin_rights=="admin"
		end

		new_user = User.new(usrname,(admin_flag==true ? "admin" : "user"))
		users_tab << new_user if admin_verified && !already_there

		return users_tab
	end

	def self.add_film(admin_name, film_name, writer, date, films_tab, users_tab)
	#TODO A corriger 
		admin_verified=false
		already_there=false

		users_tab.each do |user|
			admin_verified=true if admin_name==user.usrname && user.admin_rights=="admin"
		end

		films_tab.each do |film|
			already_there=true if film_name==film.titre
		end
		
		new_film = Film.new(film_name, writer, date)
		films_tab << new_film if !already_there

		return films_tab	
	end
end
