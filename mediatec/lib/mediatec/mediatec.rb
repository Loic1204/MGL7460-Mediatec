#bddusers : usrname;(admin/user)
#bddfilms : film_name;writer;date;emprunt;reservation
module Mediatec
  def self.borrow(film_name, usrname, films, users)
    film_name.gsub!('_',' ')

    user_verified = false
    users.each do |user|
      user_verified = true if usrname == user.usrname
    end

#user_verified = users.any? {|user| user.usrname == usrname }
    return films unless user_verified

    films.each do |film|
      film.emprunt = usrname if film_name == film.titre && film.emprunt.nil?
    end	
  end

  def self.return(name, films)
    films.each do |film|
      film.emprunt = "" if name == film.titre
    end	
  end

  def self.check(user, films)
    res = ""

    #return res if user.nil?

    films.each do |film|
      if user == film.emprunt
        res << film.titre + "\n"
      end
    end
    res
  end

  def self.search(name, available, films)
    name.gsub!('_',' ') unless name.nil? 
    res = "TITRE | REALISATEUR | DATE\n"

    films.each do |film|
      if name.nil? || film.titre =~ /#{name}/
        if !available || available && film.emprunt.nil?
          res << film.titre + "|" + film.realisateur + "|" + film.date + "\n"
        end
      end
    end
    res
  end

  def self.add_usr(admin_flag, admin_name, usrname, users)
    admin_verified = false
    already_there = false

    users.each do |user|
      already_there = true if usrname == user.usrname
      admin_verified = true if admin_name == user.usrname && user.admin_rights =~ /admin/
    end

    new_user = User.new(usrname,(admin_flag == true ? "admin" : "user"))
    users << new_user if admin_verified && !already_there
  end

  def self.add_film(admin_name, film_name, writer, date, films, users)
    admin_verified = false
    already_there = false

    film_name.gsub!('_',' ')
    writer.gsub!('_',' ')
	
    users.each do |user|
      admin_verified = true if admin_name == user.usrname && user.admin_rights =~ /admin/
    end

    films.each do |film|
      already_there = true if film_name == film.titre
    end
    return films if already_there || !admin_verified

    new_film = Film.new(film_name, writer, date, nil, nil)
    films << new_film
  end
end
