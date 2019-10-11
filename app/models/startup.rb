class Startup
  attr_accessor :name
  attr_reader :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.find_by_founder(name)
    self.all.select { |startup| startup.founder == name }
  end

  def self.domains
    self.all.map { |startup| startup.domain }
  end

  def sign_contract(vc, type, investment)
    FundingRound.new(self, vc, type, investment)
    vc.total_worth -= investment
  end

  def num_funding_rounds
    FundingRound.all.select { |round| round.startup == self }
  end

  def total_funds
    self.num_funding_rounds.map { |round| round.investment }.sum
  end

  def investors
    self.num_funding_rounds.map { |round| round.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor) }
  end
  
end
