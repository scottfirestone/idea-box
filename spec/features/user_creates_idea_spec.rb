require "rails_helper"

RSpec.feature "User creates idea", js: true do
  scenario "the new idea appears on the page" do
    visit root_path

    within('.ideas') do
      expect(page).to_not have_content("Idea Title")
      expect(page).to_not have_content("Idea Body")
    end

    click_on "Add Idea"
    fill_in "Title", with: "New Idea"
    fill_in "Body", with: "New Idea Body"
    click_on "Save"
binding.pry
    within('.ideas') do
      expect(page).to have_content("Idea Title")
      expect(page).to have_content("Idea Body")
    end

    within('.new-idea') do
      expect(page).to_not have_selector("input[value='Idea Title']")
      expect(page).to_not have_selector("input[value='Idea Body']")
    end
  end
end
