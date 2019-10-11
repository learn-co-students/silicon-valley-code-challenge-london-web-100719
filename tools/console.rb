require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vc1 = VentureCapitalist.new("alex", 10000000000)
vc2 = VentureCapitalist.new("gordy", 999999999)
vc3 = VentureCapitalist.new("peter", 999999998)
su1 = Startup.new("rugby heaven","shomz", "sports")
su2 = Startup.new("i love maths", "lanza", "maths")
su3 = Startup.new("peter's playhouse", "ayeni", "engineering")
vc1.offer_contract(su1, "seed", 50000)
vc1.offer_contract(su1, "series-a", 5000000)
vc2.offer_contract(su1, "series-a-bridge", 250000)
vc2.offer_contract(su2, "series-a", 2000000)
su3.sign_contract(vc3, "seed", 200000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

#VC
# Tres Commas x
# offer_contract x
# funding_rounds x
# portfolio x
# biggest_investment x
# invested x

#Startup
# sign contract x
# num funding rounds x
# total funds x 
# investors x
# big investors x

