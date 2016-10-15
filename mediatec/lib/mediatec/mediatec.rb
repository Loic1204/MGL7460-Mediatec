#bddusers : usrname;(admin/user)
#bddfilms : filmname;writer;date;emprunt;reservation
module Mediatec
  def self.search(name, available, lignes)
	#TODO retourner qq chose si bdd vide
 
	res = "TITRE | REALISATEUR | DATE\n"

	lignes.map do |ligne|
		tab = ligne.split(";")
		#TODO utiliser un regex pour verifier une partie du nom
		if name.nil? || name==tab[0]
			if !available || available && tab[3].length==0
				res << tab[0] + "|" + tab[1] + "|" + tab[2]
				res << "\n"
			end
		end
	end
	return res
  end

	def self.check(user, lignes)
		#TODO booking?
		res=""

		lignes.map do |ligne|
			tab = ligne.split(";")
			if user==tab[3]
				res << tab[0]
				res << "\n"
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
end
