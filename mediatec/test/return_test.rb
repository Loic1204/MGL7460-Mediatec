require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".return" do
	let(:a) { Film.new("Aaax", "Abb", "Acc", nil, nil)}
	let(:b) { Film.new("Baax", "Bbb", "Bcc", "user", nil)}
	let(:c) { Film.new("Caay", "Cbb", "Ccc", "toto", nil)}
	let(:d) { Film.new("Daay", "Dbb", "Dcc", nil, nil)}
	before { @f = [a,b,c,d] }

    describe "cas avec un retour d un film inexistant" do
      it "retourne la bdd sans l avoir modifiee" do     
        Mediatec.return("FilmInexistant", @f)
          .must_equal @f
      end
    end

    describe "cas avec un retour d un film non-emprunte" do
      it "retourne la bdd sans l avoir modifiee" do
        
        Mediatec.return("Aaax", @f)
          .must_equal @f
      end
    end

    describe "cas avec un retour d un film emprunte" do
      it "retire le usrname dans la colonne emprunt du film retourne" do
        @newf = [Film.new("Aaax", "Abb", "Acc", nil, nil),
                 Film.new("Baax", "Bbb", "Bcc", "user", nil),
                 Film.new("Caay", "Cbb", "Ccc", "", nil),
                 Film.new("Daay", "Dbb", "Dcc", nil, nil)]
        Mediatec.return("Caay", @f)
          .must_equal @newf
      end
    end
  end
end
