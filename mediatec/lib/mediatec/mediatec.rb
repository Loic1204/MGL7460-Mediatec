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

	def self.addusr(adminflag, adminname, usrname, lignes)
		res=""
		adminverified=false
		alreadythere=false

		lignes.map do |ligne|
			tab = ligne.split(";")
			res << ligne
			alreadythere=true if name==tab[0]
			adminverified=true if adminname==tab[0]
		end
		res<<"\n"+usrname+";"+(adminflag==true ? "admin" : "user") if adminverified && !alreadythere

		return res
	end
end
