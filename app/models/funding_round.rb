class FundingRound

    attr_reader :startup, :venture_capitalist, :funding_round_type, :investment_amount

    @@all = []

    def initialize(startup, venture_capitalist, funding_round_type, investment_amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @funding_round_type = funding_round_type
        @investment_amount = investment_amount.to_f
        @@all << self
    end 

    def investment_amount=(amount)
        if amount < 0
            @investment_amount = 0.0
        end
        @investment_amount = amount.to_f
    end 

    def self.all
        @@all
    end 

end
