require "rails_helper"

RSpec.feature "User adds an idea", js: true do
  scenario "they see the new idea" do
    idea_params = { title: "idea title", body: "idea body" }

    visit root_path

    within("#ideas") do
      expect(page).to_not have_content(idea_params[:title])
      expect(page).to_not have_content(idea_params[:body])
      expect(page).to_not have_content("Swill")
    end

    fill_in "title", with: idea_params[:title]
    fill_in "body", with: idea_params[:body]
    click_on "Create Idea"

    within("#ideas") do
      expect(page).to have_content(idea_params[:title])
      expect(page).to have_content(idea_params[:body])
      expect(page).to have_content("Swill")
    end
  end
end
