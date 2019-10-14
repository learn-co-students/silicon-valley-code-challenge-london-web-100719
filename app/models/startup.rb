class Startup

    attr_reader :domain, :founder, :name

    @@all=[]

    def self.all
        @@all
    end

    def self.find_by_founder(founder_string)
        Startup.all.find {|startup| startup.founder==founder_string}
    end

    def self.domains 
        Startup.all.map {|startup| startup.domain}
    end

    def initialize(name, founder, domain)
        @name=name
        @founder=founder
        @domain=domain
        save
    end

    def save
        @@all << self
    end

    def pivot(domain_string, name_string)
        @domain = domain_string
        @name = name_string
    end

    def sign_contract(vc_instance, type_string, investment_float)
        FundingRound.new(type_string,self,vc_instance,investment_float)
    end

    def funding_rounds
        FundingRound.all.select{|round|round.startup==self}
    end

    def num_funding_rounds
        funding_rounds.size
    end

    def total_funds
        funding_rounds.map {|round| round.investment.to_i}.reduce{|sum,element| sum+=element}
    end

    def investors
        funding_rounds.map {|round| round.venture_capitalist}.uniq
    end

    def big_investors
        # find all the venture capitalists that have invested in this company
        # check whether found VCs are in the Trés Commas Club
        # Returns a **unique** array
        
        investors.select{|investor|VentureCapitalist.tres_commas_club.includes?(investor)}
    end

end
