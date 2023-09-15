class Race
  attr_reader :office, :candidates, :open
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate)
    @candidates << candidate
  end

  def open?
    @open = true
  end

  def close!
    @open = false
  end

  def winner
    if @open == true
      winner = false
    else 
      @candidates.map do |candidate|
        @vote_count_array = candidate.votes
      end
      if 
        @vote_count_array.nonzero? == nil
        winner = "tie"
      else
        winner = @vote_count_array.max
      end
    end
    return winner
  end
end
