class Startup
    attr_accessor :name, :vc, :type, :amount, :investors
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        Startup.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = name
    end

    def self.find_by_founder(founder_name)
        Startup.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        Startup.all.map {|startup| startup.domain}
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def total_funds
        num_funding_rounds.reduce(0) {|sum, round| sum + round.amount}
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def investors
        num_funding_rounds.map {|round| round.vc}.uniq
    end

    def big_investors
        self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end

end
