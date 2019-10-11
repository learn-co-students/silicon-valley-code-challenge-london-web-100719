require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

my_startup = Startup.new("Google","Li Xie","Technology")
my_second_startup = Startup.new("Facebook","Daniel Xie","Technology")
my_third_startup = Startup.new("Deliveroo","Bob Xie","Food")

my_vc = VentureCapitalist.new("Gee-Wey Inc", 4242424242424242)
my_second_vc = VentureCapitalist.new("MJ Inc", 600000)
my_third_vc = VentureCapitalist.new("Elvis Inc", 1000000000)

my_funding_round = FundingRound.new(my_startup, my_vc, "Angel", 5)
my_second_funding_round = FundingRound.new(my_second_startup, my_third_vc, "Angel", 1000000000)
my_third_funding_round = FundingRound.new(my_third_startup, my_second_vc, "Pre-Seed", 50)
my_fourth_funding_round = FundingRound.new(my_startup, my_vc, "Angel", 30040)
my_fifth_funding_round = FundingRound.new(my_startup, my_vc, "Series b", 99990009)
my_sixth_funding_round = FundingRound.new(my_startup, my_vc, "Series ZZ", 12)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line