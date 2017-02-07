require 'csv'

class Validator
  def initialize (filename)
    @filename = filename
    @data = CSV.read(@filename)
  end

  def summary
    summaryhash = {}
    @data.each do |person|
      summaryhash[person[0]] = []
      summaryhash[person[0]] << person[1] if baddate?(person[1])
      summaryhash[person[0]] << person[2] if badage?(person[2])
      summaryhash[person[0]] << person[3] if bademail?(person[3])
      summaryhash[person[0]] << person[4] if badphone?(person[4])
    end
    puts "these are the bad fields:"
    p summaryhash
  end

  def baddate?(date)
    baddates.include?(date)
  end

  def badage?(date)
    badages.include?(date)
  end

  def bademail?(email)
    bademails.include?(email)
  end

  def badphone?(phone)
    badphones.include?(phone)
  end


  def baddates
    #creates a array of join dates
    gooddates = []
    baddates = []
    column_one = @data.map{|person| person[1]}
    dates = column_one.drop(1)

    dates.each do |string|
      gooddates += string.scan(/^\A[1-12][\/-][1-31][\/-]\d{2,4}\z$/)
    end
    baddates = dates - gooddates
    baddates
    # baddates_location = baddates.map{|date| column_one.index(date)}
    # baddates_location
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
    badages
    # badages_location = badages.map{|age| column_two.index(age)}
    # badages_location
  end

  def bademails
    goodemails = []
    bademails = []
    column_three = @data.map{|person| person[3]}
    emails = column_three.drop(1)

    emails.each do |string|
      goodemails += string.scan(/^[\w+.-]+[@][\w+.-]+[.][\w+.-]+$/)
    end
    bademails = emails - goodemails
    bademails
    # bademails_location = bademails.map{|email| column_three.index(email)}
    # bademails_location
  end

  def badphones
    goodphones = []
    badphones = []
    column_four = @data.map{|person| person[4]}
    phones = column_four.drop(1)

    phones.each do |string|
      goodphones += string.scan(/^\D?\d{1,9}\d{1,9}\d{1,9}\D?[\S|]?\d{1,9}\d{1,9}\d{1,9}[\W|\D|]?\d{1,9}\d{1,9}\d{1,9}\d{1,9}$/)
    end
    badphones = phones - goodphones
    badphones
    # badphones_location = badphones.map{|phone| column_four.index(phone)}
    # badphones_location
  end

end

v = Validator.new('userinformation.csv')
v.summary
