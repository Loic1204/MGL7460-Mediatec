#bddusers : usrname;(admin/user)
#bddfilms : film_name;writer;date;emprunt;reservation
module Mediatec
  def self.borrow(film_name, usrname, films, users)
    film_name.gsub!('_',' ')

    user_verified = false
    user_verified = users.any? { |user| user.usrname == usrname }
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
    #res = films.inject("") do |checklist, film| 
    #  checklist << film.titre + "\n" if !film.emprunt.nil? && user == film.emprunt
    #end
    # Retourne "error: undefined method `<<' for nil:NilClass" sauf si on enleve le "if"

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

    already_there = users.any? { |user| usrname == user.usrname }
    admin_verified = users.any? { |user| admin_name == user.usrname && user.admin_rights =~ /admin/ }
    return users if already_there || !admin_verified

    users << User.new(usrname, (admin_flag ? "admin" : "user"))
  end

  def self.add_film(admin_name, film_name, writer, date, films, users)
    admin_verified = false
    already_there = false

    film_name.gsub!('_',' ')
    writer.gsub!('_',' ')

    admin_verified = users.any? { |user| admin_name == user.usrname && user.admin_rights =~ /admin/ }
    already_there = films.any? { |film| film_name == film.titre}
    return films if already_there || !admin_verified

    films << Film.new(film_name, writer, date, nil, nil)
  end
end
