require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe "add_usr" do
    it "ajoute un user simple" do
      avec_fichier 'testbddu.txt', ["user;admin"] do
        mediatec( '--bddu=testbddu.txt add_usr user newuser' )
        contenu_fichier('testbddu.txt').must_equal ["user;admin","newuser;user"]
      end
    end

    it "ajoute un user admin" do
      avec_fichier 'testbddu.txt', ["user;admin"] do
        mediatec( '--bddu=testbddu.txt add_usr -a user newadmin' )
        contenu_fichier('testbddu.txt').must_equal ["user;admin","newadmin;admin"]
      end
    end
  end
end
