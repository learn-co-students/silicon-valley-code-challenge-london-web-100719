class FundingRound

    attr_reader    :startup, :venture_capitalist, :investment, :type 

    @@all=[]
    
    def self.all
        @@all
    end

    def initialize(type, startup, venture_capitalist, investment)
        @type=type
        @startup=startup
        @venture_capitalist=venture_capitalist
        @investment=investment
        save
    end

    def save
        @@all << self
    end


end
