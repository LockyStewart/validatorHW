require 'minitest/autorun'
require 'minitest/pride'
require './validator.rb'

class ValidatorTest < Minitest::Test
  def test_initialize
    assert Validator.new('userinformation.csv')
  end

  def test_userchecker
    userchecker = Validator.new('userinformation.csv')
    assert userchecker == []
    #but what do I put in this array? Do i have to manually go check the file?#
  end
end
