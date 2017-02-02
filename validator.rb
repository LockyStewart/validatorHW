require 'csv'

class Validator
  def initialize (a)
    @filename = filename
    @data = CSV.read(@filename)
  end

  def data
    @data
  end

  end

  def joindate (a)
    #creates a array of join dates
    row_one = @data.map{|person| person[1]}
    dates = row_one.drop(1)
    dates
  end
end
