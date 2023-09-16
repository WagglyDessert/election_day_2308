require './lib/candidate'
require './lib/race'

RSpec.describe "#Candidate set up" do
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate_1 = Candidate.new({name: "Diana D", party: :democrat})
  end

  it 'exists' do
    expect(@race).to be_instance_of Race
  end

  it 'has an office' do
    expect(@race.office).to eq("Texas Governor")
  end

  it 'does not have any candidates' do
    expect(@race.candidates).to eq([])
  end

  it 'exists' do
    expect(@candidate_1).to be_instance_of Candidate
  end

  it 'has candidate details' do
    expect(@candidate_1.class).to eq(Candidate)
    expect(@candidate_1.name).to eq("Diana D")
    expect(@candidate_1.party).to eq(:democrat)
  end

  it 'can register candidates' do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
      expect(candidate1.votes).to eq(0)
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      expect(@race.candidates).to eq([candidate1, candidate2])
  end
end