require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("star - tup - uan", "founder", "@domain.com")
startup2 = Startup.new("star - tup - uan", "founder", "@2domain.com")
startup3 = Startup.new("star - tup - uan", "founder", "@3domain.com")
vc2 = VentureCapitalist.new("vc1", 100000000000000000)
vc3 = VentureCapitalist.new("vc2", 100000000000000000)
vc4 = VentureCapitalist.new("vc3", 1000000)
funding1 = FundingRound.new("round1", "vc", "type", -1)

test = startup1.sign_contract("vc1", "type", 10)
test2 = startup1.sign_contract(vc2, "type", 10000)
test3 = startup2.sign_contract(vc2, "type", 100)
test2 = startup3.sign_contract(vc2, "type", 10)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line