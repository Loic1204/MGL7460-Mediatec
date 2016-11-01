module FluxUser
  def self.read(file_name)
    users = []

    flux = File.open(file_name)
    flux.readlines.map do |ligne|
      usrname, rights = ligne.delete!("\n").split(";")
      users << User.new(usrname, rights)
    end

    flux.close

    return users
  end

  def self.write(file_name, users)
    flux = File.open(file_name, "w")
    users.each do |user|
      flux.puts user.usrname + ";" + user.admin_rights
    end
    flux.close
  end
end
