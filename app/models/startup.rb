class Startup
    
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
    end

    def self.all
        @@all
    end
    
    def self.find_by_founder(founder_name)
        self.all.find{ |startup| startup.founder == founder_name }
    end

    def self.domains
        self.all.map{|startup| startup.domain }.uniq
    end

    def sign_contract(venture_capitalist, funding_round_type, investment_amount)
        FundingRound.new(self, venture_capitalist, funding_round_type, investment_amount)
    end

    def num_funding_rounds
        FundingRound.all.count{ |round| round.startup == self }
    end

    def funding_rounds
        FundingRound.all.select{|round| round.startup == self}
    end

    def total_funds
        self.funding_rounds.map{|round| round.investment_amount}.sum
    end

    def investors
        self.funding_rounds.map{ |round| round.venture_capitalist }.uniq
    end 

    def big_investors
        self.investors.select{ |vc| vc.total_worth > 1000000000 }
    end 

end
