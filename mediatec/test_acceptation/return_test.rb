require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe "return" do
    it "rend un film" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        mediatec( '--bddf=testbddf.txt return Inception' )
        contenu_fichier('testbddf.txt').must_equal ["Ant-Man;Peyton Reed;2015;;","Avengers;Joss Whedon;2015;;","Inception;Christopher Nolan;2010;;"]
      end
    end
  end
end
