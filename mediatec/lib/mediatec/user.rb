class User
  attr_reader :usrname
  attr_reader :admin_rights

  def initialize(name, admin)
    @usrname, @admin_rights = name, admin
  end
end
