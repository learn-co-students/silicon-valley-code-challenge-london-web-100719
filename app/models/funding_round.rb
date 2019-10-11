require 'pry'

class FundingRound

    attr_reader :startup, :vc, :type, :investment
    attr_accessor

    @@all = []

    def initialize(startup, vc, type, investment)

        @startup = startup
        @vc = vc
        @type = type
        @investment = investment.to_f

        FundingRound.all << self
        
    end

    def self.all

        @@all

    end
    
end