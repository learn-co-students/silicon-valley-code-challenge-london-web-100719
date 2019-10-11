require 'pry'

class Startup

    attr_reader :founder, :domain
    attr_accessor :name, :investors, :total_funds

    @@all = []

    def initialize(name, founder, domain)

        @name = name
        @founder = founder
        @domain = domain
        @total_funds = 0.0

        Startup.all << self
        
    end

    def self.all

        @@all

    end

    def pivot(domain, name)

        @domain = domain
        @name = name
        
    end

    def self.find_by_founder(founder)

        Startup.all.select {|startup| startup.founder == founder}
        
    end

    def self.domains

        Startup.all.map {|startup| startup.domain}
        
    end

    def sign_contract(vc, type, amount)

        funding_round = FundingRound.new(self, vc, type, amount)
        vc.total_worth -= amount
        
    end

    def rounds

        FundingRound.all.select {|round| round.startup == self}

    end

    def total_funds

        self.rounds.map {|round| round.investment}.sum
        
    end

    def num_funding_rounds

        FundingRound.all.select {|round| round.startup == self}.size
        
    end

    def investors

        FundingRound.all.select {|round| round.startup == self}.map {|e| e.investors}.flatten!.uniq
        
    end

    def big_investors

        @investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
        
    end
    
end