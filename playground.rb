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

dates.each do |string|
  gooddates += string.scan(/^\A[1-12][\/-][1-31][\/-]\d{2,4}\z$/)
end

baddates = dates - gooddates
p baddates



# dates = userinformation.map{|person| person[1]}
# dates.reject!{|date| date == 'joined'}
# p dates
