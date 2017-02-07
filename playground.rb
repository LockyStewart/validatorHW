# require './validator.rb'
# userdata = Validator.new ('userinformation.csv')
#
# userdata.baddates



require 'CSV'

userinformation = CSV.read('userinformation.csv')

# namehash = {}
column_names = userinformation.map{|person| person[0]}
names = column_names.drop(1)
# names.each do |name|
#   namehash[name] = []
# end


  goodphones = []
  badphones = []
  column_four = userinformation.map{|person| person[4]}
  phones = column_four.drop(1)

  phones.each do |string|
    goodphones += string.scan(/^\D?\d{1,9}\d{1,9}\d{1,9}\D?[\W|\D|]?\d{1,9}\d{1,9}\d{1,9}[\W|\D|]?\d{1,9}\d{1,9}\d{1,9}\d{1,9}$/)
  end
  badphones = phones - goodphones
  p badphones.count
  # badphones_location = badphones.map{|phone| column_four.index(phone)}
  # badphones_location


# userinformation.each do |person|
#  hashname[person[0]] = person
# end



# gooddates=[]
# baddates=[]
# row_one = userinformation.map{|person| person[1]}
# dates = row_one.drop(1)

# goodemails = []
# column_three = userinformation.map{|person| person[3]}
# emails = column_three.drop(1)
# emails.each do |string|
#   goodemails += string.scan(/^[\w+.-]+[@][\w+.-]+[.][\w+.-]+$/)
# end
# p goodemails



# # dates.each do |string|
# #   gooddates += string.scan(/^\A[1-12][\/-][1-31][\/-]\d{2,4}\z$/)
# # end
#
# baddates = dates - gooddates
# p baddates


# baddates_location = []
# baddates.each do |date|
#   baddates_location += row_one.index(date)
# end
#
# baddates_location = baddates.map{|date| row_one.index(date)}
# p baddates_location

# dates = userinformation.map{|person| person[1]}
# dates.reject!{|date| date == 'joined'}
# p dates
