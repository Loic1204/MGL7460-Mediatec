require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe "search" do
    it "affiche tous les films" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        mediatec( '--bddf=testbddf.txt search' ).
          must_equal ["TITRE | REALISATEUR | DATE","Ant-Man|Peyton Reed|2015","Avengers|Joss Whedon|2015","Inception|Christopher Nolan|2010"]
      end
    end

    it "affiche un film demande par son nom" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        mediatec( '--bddf=testbddf.txt search --name=Inception' ).
          must_equal ["TITRE | REALISATEUR | DATE","Inception|Christopher Nolan|2010"]
      end
    end

    it "affiche tous les films disponibles" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        mediatec( '--bddf=testbddf.txt search -a' ).
          must_equal ["TITRE | REALISATEUR | DATE","Ant-Man|Peyton Reed|2015","Avengers|Joss Whedon|2015"]
      end
    end

    it "affiche un film demande par son nom si il est disponible" do
      avec_fichier 'testbddf.txt', ["Ant-Man;Peyton Reed;2015;;", "Avengers;Joss Whedon;2015;;", "Inception;Christopher Nolan;2010;loicd;"] do
        mediatec( '--bddf=testbddf.txt search -a --name=Ant-Man' ).
          must_equal ["TITRE | REALISATEUR | DATE","Ant-Man|Peyton Reed|2015"]
      end
    end
  end
end
