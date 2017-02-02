require 'csv'

class Validator
  def initialize (filename)
    @filename = filename
    @data = CSV.read(@filename)
  end

  def baddates
    #creates a array of join dates
    gooddates = []
    baddates = []
    column_one = @data.map{|person| person[1]}
    dates = column_one.drop(1)

    dates.each do |string|
      gooddates += string.scan(/^\A[1-12][\/-][1-31][\/-]\d{2,4}\z$/)
      #how do I do 2 or 4, without the matchin groups issue?
    end
    baddates = dates - gooddates
    baddates_location = baddates.map{|date| column_one.index(date)}
    baddates_location
  end

  def baddates_count
    baddates.count
  end

  def badages
    goodages = []
    badages = []
    column_two = @data.map{|person| person[2]}
    ages = column_two.drop(1)

    ages.each do |string|
      goodages += string.scan(/^\d{1,115}$/)
    end
    badages = ages - goodages
    badages_location = badages.map{|age| column_two.index(age)}
    badages_location
  end

  def bademails
    goodemails = []
    column_three = @data.map{|person| person[3]}
    emails = column_three.drop(1)
    emails.each do |string|
      goodemails += string.scan(/^[\w+.-]+[@][\w+.-]+[.][\w+.-]+$/)
    end
    bademails = emails - goodemails
    bademails_location = bademails.map{|email| column_three.index(email)}
    bademails_location
  end
end
