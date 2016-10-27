require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe ".check" do
	before { @f = [Film.new("Aaa", "Abb", "Acc", nil, ""),
					Film.new("Baa", "Bbb", "Bcc", "user1", ""),
					Film.new("Caa", "Cbb", "Ccc", "user2", ""),
					Film.new("Daa", "Dbb", "Dcc", "user2", "")]}

    describe "cas avec un user n'ayant pas emprunte de films" do
      it "affiche rien lorsque reçoit un user n'ayant rien emprunte" do
        Mediatec.check("user0",@f)
          .must_be_empty
      end
    end

	describe "cas avec un user ayant emprunte exactement 1 film" do
      it "affiche 1 film lorsque reçoit un user ayant emprunte 1 film" do
        Mediatec.check("user1",@f)
          .must_equal "Baa\n"
      end
    end

	describe "cas avec un user ayant emprunte plusieurs films" do
      it "affiche 2 films lorsque reçoit un user ayant emprunte 2 films" do
        Mediatec.check("user2",@f)
          .must_equal "Caa\nDaa\n"
      end
    end
  end
end
