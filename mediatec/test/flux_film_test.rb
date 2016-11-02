require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe FluxFilm do
	describe ".read" do
      let(:nom_fichier) { "bddfilm.txt" }
      let(:lignes) { ["film1;rea1;1234;user1;user2", "film2;rea1;2009;;", "film3;rea2;2009;;user1"] }
      let(:fichier_mock) { MiniTest::Mock.new }
      let(:open_file_stub) { ->(f,*args) { f == nom_fichier ? fichier_mock : nil } }

      before do
        fichier_mock.expect( :readlines, lignes, [] )
      end

      it "renvoie un tableau de Films" do
        fichier_mock.expect( :close, nil, [] )

        tab = []
        File.stub :open, open_file_stub do
          tab = FluxFilm.read( nom_fichier )
        end

        fichier_mock.verify
        tab.must_equal [Film.new("film1","rea1", "1234", "user1", "user2"), Film.new("film2","rea1", "2009", nil, nil), Film.new("film3","rea2", "2009", "", "user1")]
      end
    end

    describe ".write" do
      let(:nom_fichier) { "bddusr.txt" }
      let(:films) { [Film.new("film1","rea1", "1234", "user1", "user2"), Film.new("film2","rea1", "2009", nil, nil), Film.new("film3","rea2", "2009", nil, "user1")] }
      let(:fichier_mock) { MiniTest::Mock.new }
      let(:open_file_stub) { ->(f,*args) { f == nom_fichier ? fichier_mock : nil } }

      it "renvoie un CVS des Films" do
        fichier_mock.expect( :puts, nil, ["film1;rea1;1234;user1;user2"] )
        fichier_mock.expect( :puts, nil, ["film2;rea1;2009;;"] )
        fichier_mock.expect( :puts, nil, ["film3;rea2;2009;;user1"] )
        fichier_mock.expect( :close, nil, [] )

        File.stub :open, open_file_stub do
          FluxFilm.write( nom_fichier, films )
        end

        fichier_mock.verify
      end
    end
  end
end
