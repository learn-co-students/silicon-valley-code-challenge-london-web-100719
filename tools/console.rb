require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

company1 = Startup.new("Kupp", "John Adams", "Blockchain plastic cups")
company2 = Startup.new("Chaarg", "Nick T.", "Charging appliances through MLMs")
company3 = Startup.new("Bocks", "N. Nedelchev", "Distrupt Big Cardboard")

vc1 = VentureCapitalist.new("William G.", 12000000000)
vc2 = VentureCapitalist.new("Jeffrey B.", 123000000000)
vc3 = VentureCapitalist.new("Kevin O.", 400000000)

company1.sign_contract(vc1, "Angel", 12)
company1.sign_contract(vc2, "Series-A", 100000)
company2.sign_contract(vc3, "Series-B", 7000000)
company3.sign_contract(vc1, "Angel", 7)

round1 = FundingRound.new(company1, vc1, "Angel", 100000000)
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line