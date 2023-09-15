require './lib/candidate'

RSpec.describe "#Candidate set up" do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  it 'exists' do
    expect(@diana).to be_instance_of Candidate
  end

  it 'has a name' do
    expect(@diana.name).to eq('Diana D')
  end

  it 'has a party' do
    expect(@diana.party).to eq(:democrat)
  end

  it 'has votes' do
    expect(@diana.votes).to eq(0)
  end

  it 'can vote for Diana' do
    @diana.vote_for!
    @diana.vote_for!
    @diana.vote_for!
    expect(@diana.votes).to eq(3)
    @diana.vote_for!
    expect(@diana.votes).to eq(4)
  end
end