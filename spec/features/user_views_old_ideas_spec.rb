require "rails_helper"

RSpec.feature "User views old ideas" do
  scenario "they see the previously created ideas" do
    idea = create(:idea)
binding.pry
    visit root_path
save_and_open_page
    within("#ideas") do
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
      expect(page).to have_content(idea.quality)
    end
  end
end
