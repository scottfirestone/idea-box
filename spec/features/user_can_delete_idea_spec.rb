require "rails_helper"

RSpec.feature "User deletes idea", js: true do
  scenario "they no longer see that idea" do
    idea = create(:idea)

    visit root_path

    expect(Idea.count).to eq(1)
    within("#ideas") do
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
      expect(page).to have_content(idea.quality)
    end

    click_on "Delete"

    expect(Idea.count).to eq(0)
    within("#ideas") do
      expect(page).to_not have_content(idea.title)
      expect(page).to_not have_content(idea.body)
      expect(page).to_not have_content(idea.quality)
    end
  end
end
