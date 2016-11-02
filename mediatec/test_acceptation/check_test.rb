require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe "check" do
    it "affiche le film emprunte" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        mediatec( '--bddf=testbddf.txt check loicd' ).
          must_equal ["Inception"]
      end
    end
  end
end
