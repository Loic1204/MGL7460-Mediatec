require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".search" do
	before { @f = [Film.new("Aaax", "Abb", "Acc", nil, ""),
					Film.new("Baax", "Bbb", "Bcc", "user1", ""),
					Film.new("Caay", "Cbb", "Ccc", "user2", ""),
					Film.new("Daay", "Dbb", "Dcc", nil, "")]}

    describe "cas avec une demande des films disponibles sans nom" do
      it "affiche les 2 films disponibles lorsque reçoit pas de nom et flag available" do
        Mediatec.search("",true,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"+
						"Daay|Dbb|Dcc\n"
      end
    end

	describe "cas avec une demande de films disponibles avec un nom existant precis" do
      it "affiche le film si il est disponible" do
        Mediatec.search("Aaax",true,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"
      end
	  it "affiche pas le film si il est indisponible" do
        Mediatec.search("Baax",true,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"
      end
    end

	describe "cas avec une demande de films disponibles avec une partie du nom" do
      it "affiche tous les films disponibles dont le titre contient la chaine donnee" do
        Mediatec.search("ax",true,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"
      end
    end

	describe "cas avec une demande des films sans nom" do
      it "affiche tous les films lorsque reçoit pas de nom et pas de flag available" do
        Mediatec.search("",false,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"+
						"Baax|Bbb|Bcc\n"+
						"Caay|Cbb|Ccc\n"+
						"Daay|Dbb|Dcc\n"
      end
    end

	describe "cas avec une demande de films avec un nom existant precis" do
      it "affiche le film correspondant au nom" do
        Mediatec.search("Aaax",false,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"
      end
	  it "affiche pas le film meme s'il est indisponible" do
        Mediatec.search("Baax",false,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Baax|Bbb|Bcc\n"
      end
    end

	describe "cas avec une demande de films avec une partie du nom" do
      it "affiche tous les films dont le titre contient la chaine donnee" do
        Mediatec.search("ax",false,@f)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"+
						"Baax|Bbb|Bcc\n"
      end
    end
  end
end
