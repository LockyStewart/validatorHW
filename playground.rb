# require './validator.rb'
# userdata = Validator.new ('userinformation.csv')
#
# userdata.baddates



require 'CSV'

userinformation = CSV.read('userinformation.csv')

gooddates=[]
baddates=[]
row_one = userinformation.map{|person| person[1]}
dates = row_one.drop(1)

goodemails = []
column_three = userinformation.map{|person| person[3]}
emails = column_three.drop(1)
emails.each do |string|
  goodemails += string.scan(/^[\w+.-]+[@][\w+.-]+[.][\w+.-]+$/)
end
p goodemails



# dates.each do |string|
#   gooddates += string.scan(/^\A[1-12][\/-][1-31][\/-]\d{2,4}\z$/)
# end

baddates = dates - gooddates
p baddates


# baddates_location = []
# baddates.each do |date|
#   baddates_location += row_one.index(date)
# end

# baddates_location = baddates.map{|date| row_one.index(date)}
# p baddates_location

# dates = userinformation.map{|person| person[1]}
# dates.reject!{|date| date == 'joined'}
# p dates
