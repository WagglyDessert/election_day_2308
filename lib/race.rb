class Race
  attr_reader :office, :candidates
  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(candidate)
    @candidates << candidate
  end

end