require 'rails_helper'

RSpec.describe Idea, type: :model do
  it do
    should define_enum_for(:quality).
      with([:Swill, :Plausible, :Genius])
  end

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:body)}
  it { should validate_presence_of(:quality)}

  it 'can be upvoted' do
    idea = create(:idea)

    expect(idea.quality).to eq("Swill")
    idea.upvote
    expect(idea.quality).to eq("Plausible")
    idea.upvote
    expect(idea.quality).to eq("Genius")
    idea.downvote
    expect(idea.quality).to eq("Plausible")
    idea.downvote
    expect(idea.quality).to eq("Swill")
  end
end
