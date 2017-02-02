require 'minitest/autorun'
require 'minitest/pride'
require './validator.rb'

class ValidatorTest < Minitest::Test
  def test_initialize
    assert Validator.new('userinformation.csv')
  end

  def test_joindate
    joindate = Validator.new('userinformation.csv')
    assert joindate == ['1/1/16','2/3/2016']
    #but what do I put in this array? Do i have to manually go check the file? do i put in the incoorect ones or the right ones?
  end
end
