require "rails_helper"

RSpec.feature "User visits ideas index" do
  scenario "they see new idea form" do
    visit "/ideas"

    expect(current_path).to eq("/ideas")
    within(".ideas") do
      expect(page).to have_content("Ideas")
    end
    within(".new-idea") do
      expect(page).to have_content("Title")
      expect(page).to have_content("Body")
      expect(page).to have_button("Save")
    end
  end
end
