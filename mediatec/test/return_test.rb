require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".return" do
	let(:a) { Film.new("Aaax", "Abb", "Acc", "toto", nil)}
	let(:b) { Film.new("Baax", "Bbb", "Bcc", "user", nil)}
	let(:c) { Film.new("Caay", "Cbb", "Ccc", "toto", nil)}
	let(:d) { Film.new("Daay", "Dbb", "Dcc", nil, nil)}
	before do
          @f = [a,b,c,d]
	end


    describe "le user retourne le film passe en parametre" do
      it "enleve le nom du user de la colonne emprunt du film"
        @newf = [Film.new("Aaax", "Abb", "Acc", "toto", nil),
                 Film.new("Baax", "Bbb", "Bcc", nil, nil),
                 Film.new("Caay", "Cbb", "Ccc", "toto", nil),
                 Film.new("Daay", "Dbb", "Dcc", nil, nil)]
        Mediatec.return("Baax",@f)
          .must_equal @newf
      end
    end
  end
end
