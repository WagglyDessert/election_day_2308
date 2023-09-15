class Election
  attr_reader :year, :races
  def initialize(year)
    @year = year
    @races = []
  end

  def add_races(race)
    @races << race
  end

  def candidates
    @races.map do |race|
      race.candidates
    end.flatten
  end

  def vote_counts
    hash = {}
    @races.map do |race|
      race.candidates.each do |candidate|
        hash[candidate.name] = candidate.votes
      end
    end
    hash
  end

end