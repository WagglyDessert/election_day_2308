require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe "#Candidate set up" do
  before(:each) do
    @election = Election.new("2023")
    @race_1 = Race.new("Texas Governor")
    @candidate_1 = Candidate.new({name: "Diana D", party: :democrat})
  end

  it 'exists' do
    expect(@election).to be_instance_of Election
  end

  it 'has a year' do
    expect(@election.year).to eq('2023')
  end

  it 'can add races' do
    expect(@election.races).to eq([])
    @election.add_races(@race_1)
    expect(@election.races).to eq([@race_1])
    @race_2 = Race.new("Colorado Governor")
    @election.add_races(@race_2)
    expect(@election.races).to eq([@race_1, @race_2])
  end

  it 'has candidates' do
    @election.add_races(@race_1)
    @race_1.register_candidate!(@candidate_1)
    expect(@race_1.candidates).to eq([@candidate_1])
    expect(@election.candidates).to eq([@candidate_1])
  end

  it 'creates a hash of candidate votes' do
    @election.add_races(@race_1)
    @race_1.register_candidate!(@candidate_1)
    #require 'pry';binding.pry
    expect(@election.vote_counts).to eq({@candidate_1.name => 0})
    @candidate_1.vote_for!
    expect(@election.vote_counts).to eq({@candidate_1.name => 1})
  end
end