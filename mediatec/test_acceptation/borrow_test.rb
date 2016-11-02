require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe "borrow" do
    it "emprunte un film" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        avec_fichier 'testbddu.txt', ["user;admin"] do
          mediatec( '--bddf=testbddf.txt --bddu=testbddu.txt borrow Avengers user' )
          contenu_fichier('testbddf.txt').must_equal ["Ant-Man;Peyton Reed;2015;;","Avengers;Joss Whedon;2015;user;","Inception;Christopher Nolan;2010;loicd;"]
        end
      end
    end
  end
end
