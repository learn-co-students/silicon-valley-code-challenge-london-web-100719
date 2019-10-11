require 'pry'

class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth, :funding_rounds

    @@all = []

    def initialize(name, total_worth)

        @name = name
        @total_worth = total_worth
        

        VentureCapitalist.all << self
        
    end

    def self.all

        @@all

    end

    def self.tres_commas_club

        VentureCapitalist.all.select {|vc| vc.total_worth > 1000000000}
        
    end
    
    def offer_contract(startup, type, amount)

        FundingRound.new(startup, self, type, amount)
        
    end

    def funding_rounds

        FundingRound.all.select {|round| round.vc == self}
        
    end

    def portfolio

        self.funding_rounds.map {|round| round.startup}.uniq
        
    end

    def biggest_investment

        self.funding_rounds.max_by {|round| round.investment}
        
    end

    def invested(domain)

        var1 = self.funding_rounds.select {|round| round.startup.domain.include?(domain)}
        var1.map {|round| round.investment}.sum

    end
    
end