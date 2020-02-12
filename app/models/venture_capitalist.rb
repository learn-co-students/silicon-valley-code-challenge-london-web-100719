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
    self.all.select { |vc| vc.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
    @total_worth -= investment
  end

  def funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self }
  end

  def portfolio
    self.funding_rounds.map { |round| round.startup }.uniq
  end

  def biggest_investment
    self.funding_rounds.sort_by(&:investment).last
  end

  def self.invested(domain)
    FundingRound.all.select { |round| round.startup.domain == domain }.map { |round| round.investment}.sum
  end
end