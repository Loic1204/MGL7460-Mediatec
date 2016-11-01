require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".add_film" do
	let(:a) { Film.new("Aaa", "aaa", "1955", nil, nil) }
	let(:b) { Film.new("Bbb", "bbb", "2015", nil, nil) }
	let(:c) { Film.new("Ccc", "ccc", "2004", nil, nil) }
	let(:d) { Film.new("Ddd", "ddd", "2016", nil, nil) }  
	let(:u_one) { User.new("user", "admin")}
	let(:u_two) { User.new("toto", "user")}
	before { @f = [a,b,c,d]}
	before { @u = [u_one,u_one]}

    describe "cas avec une demande de creation d'un film par un user sans droits d'admin" do
      it "retourne la table sans modification lorsque les droits d'admin ne sont pas verifies" do
        Mediatec.add_film("toto","Eeee","eeee", "2015", @f, @u)
          .must_equal @f
      end
    end

    describe "cas avec une creation d'un film deja existant" do
      it "retourne la table sans modification lorsque recoit un titre de film deja existant" do
        Mediatec.add_film("user","Aaa","aaa","1955", @f, @u)
          .must_equal @f
      end
    end

    describe "cas avec une creation d'un nouveau film par user avec droits d'admin" do
      it "retourne la table avec une nouvelle ligne de film lorsque cree par user avec flag admin" do
		@newf = [a,b,c,d,Film.new("Fff", "fff", "2016", nil, nil)]
        Mediatec.add_film("user","Fff", "fff", "2016", @f, @u)
          .must_equal @newf
      end
    end
  end
end
