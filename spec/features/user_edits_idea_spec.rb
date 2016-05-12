require "rails_helper"

RSpec.feature "User edits an idea", js: true do
  scenario "they see the new idea info" do
    idea = Idea.create(title: "OG-Title", body: "OG-Body")

    visit root_path
    title = find(:xpath,"//*[normalize-space()='OG-Title']", match: :first)
    title.click
    title.sendKeys("Updated-Title")
    find("h1").click

    within("#ideas") do
      expect(page).to have_content("Updated-Title")
      expect(page).to have_content("Updated-Body")
      expect(page).to_not have_content("OG-Title")
      expect(page).to_not have_content("OG-Body")
    end
    expect(Idea.count).to eq(1)
  end
end
