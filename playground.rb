# require './validator.rb'
#
# userdata = Validator.new ('userinformation.csv')
#
# p userinformation.data


require 'CSV'

userinformation = CSV.read('userinformation.csv')

# dates = userinformation.map{|person| person[1]}
# dates.reject!{|date| date == 'joined'}
# p dates

row_one = userinformation.map{|person| person[1]}
dates = row_one.drop(1)
p dates
