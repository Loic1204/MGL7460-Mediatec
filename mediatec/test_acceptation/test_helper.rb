gem 'minitest', '=5.4.3'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'

## tiré de test_helper.rb du programme mini-sed

class Object
  def _describe( test )
    puts "--- On saute les tests pour \"#{test}\" ---"
  end

  def _it( test )
    puts "--- On saute le test \"#{test}\" ---"
  end
end

#
# Cree un fichier temporaire avec le contenu indique.  Execute ensuite
# le bloc recu, puis supprime le fichier temporaire.
#
# @param [String] nom_fichier
# @param [Array<String>] contenu lignes contenues dans le fichier
# @return [void]
# @yield [void]
#
def avec_fichier( nom_fichier, contenu )
  # On cree le fichier.
  File.open( nom_fichier, "w" ) do |fich|
    contenu.each do |ligne|
      fich.puts  ligne
    end
  end

  # On execute le bloc.
  yield

  # On supprime le fichier.
  FileUtils.rm_f nom_fichier
end

#
# Execute la commande indiquee puis retourne la liste des lignes
# emises sur stdout suite a l'execution de la commande.
#
# @param [String] cmd La commande a executer (sans 'bin/mini-sed')
# @return [Array<String>] La liste des lignes produites sur stdout
#
def mediatec ( cmd )
  # On execute la commande indiquee et on retourne un Array des lignes
  # obtenues.
  %x{bundle exec bin/mediatec #{cmd}}.split("\n")
end

#
# Retourne le contenu d'un fichier sous forme d'une liste de lignes,
# sans les sauts de lignes.
#
# @param [String] nom_fichier
# @return [Array<String>] ou les "\n" finaux ont ete supprimes
#
def contenu_fichier( nom_fichier )
  IO.readlines(nom_fichier).map(&:chomp)
end
