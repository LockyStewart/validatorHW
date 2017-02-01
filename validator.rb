require 'csv'

class Validator
  def initialize (a)
    @filename = filename
    @data = CSV.read(@filename)
  end

  def userchecker (a)
    #process things
  end
end
