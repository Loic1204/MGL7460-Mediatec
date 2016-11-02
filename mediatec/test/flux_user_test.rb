require 'test_helper'
require 'mediatec'

describe Mediatec do
  describe FluxUser do
	describe ".read" do
      let(:nom_fichier) { "bddusr.txt" }
      let(:lignes) { ["test1;admin", "test2;user", "test3;admin"] }
      let(:fichier_mock) { MiniTest::Mock.new }
      let(:open_file_stub) { ->(f,*args) { f == nom_fichier ? fichier_mock : nil } }

      before do
        fichier_mock.expect( :readlines, lignes, [] )
      end

      it "renvoie un tableau de Users" do
        fichier_mock.expect( :close, nil, [] )

        tab = []
        File.stub :open, open_file_stub do
          tab = FluxUser.read( nom_fichier )
        end

        fichier_mock.verify
        tab.must_equal [User.new("test1","admin"), User.new("test2","user"), User.new("test3","admin")]
      end
    end

    describe ".write" do
      let(:nom_fichier) { "bddusr.txt" }
      let(:users) { [User.new("test1","admin"), User.new("test2","user"), User.new("test3","admin")] }
      let(:fichier_mock) { MiniTest::Mock.new }
      let(:open_file_stub) { ->(f,*args) { f == nom_fichier ? fichier_mock : nil } }

      it "renvoie un CVS des Users" do
        fichier_mock.expect( :puts, nil, ["test1;admin"] )
        fichier_mock.expect( :puts, nil, ["test2;user"] )
        fichier_mock.expect( :puts, nil, ["test3;admin"] )
        fichier_mock.expect( :close, nil, [] )

        File.stub :open, open_file_stub do
          FluxUser.write( nom_fichier, users )
        end

        fichier_mock.verify
      end
    end
  end
end
