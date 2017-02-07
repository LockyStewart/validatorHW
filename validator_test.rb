require 'minitest/autorun'
require 'minitest/pride'
require './validator.rb'

class ValidatorTest < Minitest::Test
  def test_initialize
    assert Validator.new('userinformation.csv')
  end

  def test_baddates
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.baddates.count == 5
    #but what do I put in this array? Do i have to manually go check the file? do i put in the incoorect ones or the right ones?
  end

  def test_badages
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.badages.count == 0
  end
  def test_bademails
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.bademails.count == 2
  end
  def test_badphones
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.badphones.count == 3
  end

end
