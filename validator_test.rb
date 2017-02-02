require 'minitest/autorun'
require 'minitest/pride'
require './validator.rb'

class ValidatorTest < Minitest::Test
  def test_initialize
    assert Validator.new('userinformation.csv')
  end

  def test_baddates
    userinfo = Validator.new('userinformation.csv')
    assert userinfo.baddates == ["2016-02", "13/03/2016", "442016", "2016-07-07", "Yesterday"]
    #but what do I put in this array? Do i have to manually go check the file? do i put in the incoorect ones or the right ones?
  end
end
