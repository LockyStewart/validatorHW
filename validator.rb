require 'csv'

class Validator
  def initialize (filename)
    @filename = filename
    @data = CSV.read(@filename)
  end

  def baddates
    #creates a array of join dates
    gooddates=[]
    baddates=[]
    row_one = @data.map{|person| person[1]}
    dates = row_one.drop(1)

    dates.each do |string|
      gooddates += string.scan(/^\A[1-12][\/-][1-31][\/-]\d{2,4}\z$/)
    end

    goodates
  end
end
