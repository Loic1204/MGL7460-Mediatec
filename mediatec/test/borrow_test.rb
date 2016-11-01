require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".borrow" do
	let(:a) { Film.new("Aaax", "Abb", "Acc", nil, nil)}
	let(:b) { Film.new("Baax", "Bbb", "Bcc", "user", nil)}
	let(:c) { Film.new("Caay", "Cbb", "Ccc", "toto", nil)}
	let(:d) { Film.new("Daay", "Dbb", "Dcc", nil, nil)}
	let(:u_one) { User.new("user", "admin")}
	let(:u_two) { User.new("toto", "user")}
	before do
      @f = [a,b,c,d]
      @u = [u_one,u_two]
	end

    describe "cas avec une demande d emprunt par un user inexistant d un film disponible " do
      it "retourne la bdd sans l avoir modifiee" do     
        Mediatec.borrow("Aaax","titi", @f, @u)
          .must_equal @f
      end
    end

    describe "cas avec une demande d emprunt d un film disponible par un user existant" do
      it "ajoute le usrname dans la colonne emprunt du film demande" do
        @newf = [Film.new("Aaax", "Abb", "Acc", "toto", nil),
                 Film.new("Baax", "Bbb", "Bcc", "user", nil),
                 Film.new("Caay", "Cbb", "Ccc", "toto", nil),
                 Film.new("Daay", "Dbb", "Dcc", nil, nil)]
        Mediatec.borrow("Aaax","toto", @f, @u)
          .must_equal @newf
      end
    end

    describe "cas avec une demande d emprunt d un film non disponible par un user existant" do
      it "retourne la bdd sans l avoir modifiee" do
        Mediatec.borrow("Baax","toto", @f, @u)
          .must_equal @f
      end
    end

    describe "cas avec une demande d emprunt d un film inexistant par un user existant" do
      it "retourne la bdd sans l avoir modifiee" do
        Mediatec.borrow("FilmInexistant", "toto", @f, @u)
          .must_equal @f
      end
    end	
  end
end
