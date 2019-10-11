class VentureCapitalist

    attr_accessor :total_worth
    attr_reader :name

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end 

    def self.tres_commas_club
        @@all.select{|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, funding_round_type, investment_amount)
        FundingRound.new(startup, self, funding_round_type, investment_amount)
    end

    def funding_rounds
        FundingRound.all.select{ |round| round.venture_capitalist == self }
    end 

    def portfolio
        self.funding_rounds.map{|round| round.startup }.uniq
    end 

    def biggest_investment
        self.funding_rounds.sort_by{|round| round.investment_amount }[-1]
    end

    def get_startup_by_domain(domain)
        self.funding_rounds.select{|round| round.startup.domain == domain}
    end

    def invested(domain)
        self.get_startup_by_domain(domain).map{|round|round.investment_amount}.sum
    end
end
