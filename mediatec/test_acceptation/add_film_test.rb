require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe "add_film" do
    it "ajoute un film" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        avec_fichier 'testbddu.txt', ["user;admin"] do
          mediatec( '--bddf=testbddf.txt --bddu=testbddu.txt add_film user NewFilm SuperWriter Not2016Please' )
          contenu_fichier('testbddf.txt').must_equal ["Ant-Man;Peyton Reed;2015;;","Avengers;Joss Whedon;2015;;","Inception;Christopher Nolan;2010;loicd;","NewFilm;SuperWriter;Not2016Please;;"]
        end
      end
    end
  end
end
