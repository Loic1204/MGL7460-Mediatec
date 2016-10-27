require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".add_usr" do
	let(:a) { User.new("A", "admin") }
	let(:b) { User.new("B", "user") }
	let(:c) { User.new("C", "user") }
	let(:d) { User.new("D", "admin") }
	before { @u = [a,b,c,d]}

    describe "cas avec une demande de creation d'un user par un user sans droits d'admin" do
      it "retourne la table sans modification lorsque les droits d'admin ne sont pas verifies" do
        Mediatec.add_usr(false,"B","T",@u)
          .must_equal @u
      end
    end

    describe "cas avec une creation d'un user deja existant" do
      it "retourne la table sans modification lorsque recoit un user deja existant" do
        Mediatec.add_usr(false,"A","B",@u)
          .must_equal @u
      end
    end

    describe "cas avec une creation d'un nouveau user avec droits d'admin" do
      it "retourne la table avec une nouvelle ligne d'un admin lorsque recoit un nouveau user avec flag admin" do
		@newu = [a,b,c,d,User.new("T", "admin")]
        Mediatec.add_usr(true,"D","T",@u)
          .must_equal @newu
      end
    end

    describe "cas avec une creation d'un nouveau user sans droits d'admin" do
      it "retourne la table avec une nouvelle ligne d'un user lorsque recoit un nouveau user sans flag admin" do
		@newu = [User.new("A", "admin"),
						User.new("B", "user"),
						User.new("C", "user"),
						User.new("D", "admin"),
						User.new("T", "user")]        
		Mediatec.add_usr(false,"D","T",@u)
          .must_equal @newu
      end
    end
  end
end
