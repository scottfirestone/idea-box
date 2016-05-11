require "rails_helper"

RSpec.feature "User changes idea quality" do
  scenario "the quality is upvoted" do
    idea = create(:idea)

    expect(idea.quality).to eq("Swill")

    visit root_path
    find('.upvote', match: :first).click

    expect(idea.quality).to eq("Possible")
    expect(page).to have_content("Possible")
    expect(page).to_not have_content("Swill")
    expect(page).to_not have_content("Genius")

    find('.upvote', match: :first).click

    expect(idea.quality).to eq("Genius")
    expect(page).to have_content("Genius")
    expect(page).to_not have_content("Swill")
    expect(page).to_not have_content("Possible")
  end
end
