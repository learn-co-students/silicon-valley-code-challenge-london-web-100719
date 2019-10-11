class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_i
        VentureCapitalist.all << self
    end

    def self.all
        @@all
    end

    def tres_commas?
        @total_worth > 1000000000
    end

    def self.tres_commas_club
        instance = VentureCapitalist.all.select {|vc| vc.total_worth > 1000000000}
        instance.map {|vc| vc.name}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.vc == self}
    end

    def portfolio
        funding_rounds.map {|round| round.startup}
    end

    def biggest_investment
        funding_rounds.max_by {|round| round.amount}
    end

    def invested(domain)
        array = funding_rounds.select {|round| round.startup.domain == domain}
        array.map {|round| round.amount}.sum
    end

end
