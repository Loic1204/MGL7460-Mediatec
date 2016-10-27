#require 'test/unit'
#
## Add test libraries you want to use here, e.g. mocha
#
#class Test::Unit::TestCase
#
#  # Add global extensions to the test case class here
#  
#end

gem 'minitest', '=5.4.3'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'

class Object
  def _describe( test )
    puts "--- On saute les tests pour \"#{test}\" ---"
  end

  def _it( test )
    puts "--- On saute le test \"#{test}\" ---"
  end
end
