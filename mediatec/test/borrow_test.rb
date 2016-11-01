require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".borrow" do
	let(:a) { Film.new("Aaax", "Abb", "Acc", nil, "")}
	let(:b) { Film.new("Baax", "Bbb", "Bcc", "user1", "")}
	let(:c) { Film.new("Caay", "Cbb", "Ccc", "user2", "")}
	let(:d) { Film.new("Daay", "Dbb", "Dcc", nil, "")}
	let(:u_one) { User.new("user", "admin")}
	let(:u_two) { User.new("toto", "user")}
	before { @u = [u_one,u_two]}
	before { @f = [a,b,c,d]}

    describe "cas avec une demande d emprunt par un user inexistant d un film disponible " do
      it "affiche la liste des films disponibles lorsque reçoit pas de nom existant dans la base" do
        Mediatec.borrow("Aaax","titi", @f, @u)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"+
						"Daay|Dbb|Dcc\n"
      end
    end

    describe "cas avec une demande d emprunt d un film disponible par un user existant" do
      it "affiche le film avec le nom de l emprunteur" do
        Mediatec.borrow("Aaax","toto", @f, @u)
          .must_equal "TITRE | REALISATEUR | DATE | EMPRUNT\n"+
						"Aaax|Abb|Acc|toto\n"
      end
    end

    describe "cas avec une demande d emprunt d un film non disponible par un user existant" do
      it "affiche tous les films disponibles pouvant etre emprunte" do
        Mediatec.borrow("Baax","toto", @f, @u)
          .must_equal "TITRE | REALISATEUR | DATE\n"+
						"Aaax|Abb|Acc\n"+
						"Daay|Dbb|Dcc\n"
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
  end
end
