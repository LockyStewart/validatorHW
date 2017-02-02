require 'minitest/autorun'
require 'minitest/pride'
require './validator.rb'

class ValidatorTest < Minitest::Test
  def test_initialize
    assert Validator.new('userinformation.csv')
  end

  def test_baddates
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.baddates == [2, 4, 5, 6, 7]
    #but what do I put in this array? Do i have to manually go check the file? do i put in the incoorect ones or the right ones?
  end

  def test_baddates_count
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.baddates_count == 5
  end

  def test_badages
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.badages == []
  end
  
end
