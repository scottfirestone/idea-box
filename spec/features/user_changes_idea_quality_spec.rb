require "rails_helper"

RSpec.feature "User changes idea quality", js: true do
  scenario "the quality is upvoted" do
    idea = create(:idea)

    expect(idea.quality).to eq("Swill")

    visit root_path
    find('span.upvote').click

    expect(page).to have_content("Plausible")
    expect(page).to_not have_content("Swill")
    expect(page).to_not have_content("Genius")

    find('span.upvote').click

    expect(page).to have_content("Genius")
    expect(page).to_not have_content("Swill")
    expect(page).to_not have_content("Plausible")
  end

  scenario "the quality is downvoted" do
    idea = create(:idea)

    idea.update(quality: "Genius")

    visit root_path
    find('span.downvote').click

    expect(page).to have_content("Plausible")
    expect(page).to_not have_content("Swill")
    expect(page).to_not have_content("Genius")

    find('span.downvote').click

    expect(page).to have_content("Swill")
    expect(page).to_not have_content("Genius")
    expect(page).to_not have_content("Plausible")
  end
end
