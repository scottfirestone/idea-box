require "rails_helper"

RSpec.feature "User views old ideas", js: true do
  scenario "they see the previously created ideas" do
    idea = create(:idea)

    visit root_path

    within("#ideas") do
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
      expect(page).to have_content(idea.quality)
    end
  end
end
