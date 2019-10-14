class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all=[]

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|vc| vc.total_worth>1000000000}
    end

    def initialize(name,total_worth)
        @name=name
        @total_worth=total_worth
       save
    end

    def save
        @@all << self
    end

    def offer_contract(startup_instance, type_string, investment_float)
        FundingRound.new(type_string, startup_instance, self, investment_float)
    end
 
    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist==self}
    end

    def portfolio
        funding_rounds.map{|round|round.startup}.uniq
    end

    def biggest_investment
        result=0
        funding_rounds.each {|round| result=round.investment if round.investment>result }
        result
    end

    def invested(domain)
        funding_rounds.select{|round| round.startup.domain==domain}.reduce(0){|sum,round|sum+=round.investment}
    end


end
