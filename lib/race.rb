class Race
  attr_reader :office, :candidates, :open
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate)
    candidate = Candidate.new(candidate)
    @candidates << candidate
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    vote_count_array = []
    candidate_name_array = []
    @candidates.each do |candidate|
      vote_count_array << candidate.votes
    end
    @candidates.each do |candidate|
      candidate_name_array << candidate.name
    end
    if @open == true
      return false
    elsif
      vote_count_array.sum == 0
      return "tie"
    else
      index = vote_count_array.find_index(vote_count_array.max)
      winner = candidate_name_array[index]
      return winner
    end
  end

  # def winner
  #   return false if @open
  #   @candidates.max_by { |candidate| candidate.votes }
  # end

  # def winner
  #   return false if @open
  #   sorted_votes = @candidates.sort_by { |candidate| candidate.votes }
    
  #   if sorted_votes[0].votes == sorted_votes[1].votes
  #     return "It's a tie!"
  #   else
  #     return sorted_votes[-1]
  #   end
  # end

  def tie?
    winners = @candidates.sort { |candidate| candidate.votes }
    winners[-1].votes == winners[-2].votes
  end
end