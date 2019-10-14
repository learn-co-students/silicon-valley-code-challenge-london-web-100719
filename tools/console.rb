require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1=Startup.new("SpaceX","Elon","Space")
s2=Startup.new("Google","Bill","IT")
s3=Startup.new("Tesla","Elon","Automotive")

v1=VentureCapitalist.new("John Dow", 1000000001)
v2=VentureCapitalist.new("Peter Parker", 1200000001)
v3=VentureCapitalist.new("Mike Meyers", 12001)

s1.sign_contract(v2,"R&D",3)
s2.sign_contract(v1,"R&D",30000)

v1.offer_contract(s2,"R&D",300000)

p 's1.domain'
p s1.domain
p 's1.name'
p s1.name
p 's1.investors'
s1.investors


binding.pry
0 #leave this here to ensure binding.pry isn't the last line