class FundingRound

    attr_accessor :type, :amount, :namevc2
    attr_reader :startup, :vc

    @@all = []

    def initialize(startup, vc, type, amount)
        @startup = startup
        @vc = vc
        @type = type
        @amount = amount.to_f
        @amount = 0 if  @amount < 0
        FundingRound.all << self
    end

    def self.all
        @@all
    end
    
end
