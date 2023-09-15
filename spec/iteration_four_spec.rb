require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe "#Candidate set up" do
  before(:each) do
    @election = Election.new("2023")
    @race_1 = Race.new("Texas Governor")
    @candidate_1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate_2 = Candidate.new({name: "Roberto R", party: :republican})
  end

  it 'is open' do
    expect(@race_1.open?).to eq(true)
  end

  it 'is closed' do
    @race_1.close!
    expect(@race_1.open).to eq(false)
  end

  it 'has a winner' do
    @race_1.register_candidate!(@candidate_1)
    @race_1.register_candidate!(@candidate_2)
    #require 'pry';binding.pry
    expect(@race_1.winner).to eq(false)
    @race_1.close!
    expect(@race_1.winner).to eq("tie")
    @candidate_1.vote_for!
    expect(@race_1.winner).to eq(@candidate_1.name)
  end

  it 'tells if there was a tie' do
    @race_1.register_candidate!(@candidate_1)
    @race_1.register_candidate!(@candidate_2)
    @race_1.close!
    expect(@race_1.tie?).to eq(true)
  end
end