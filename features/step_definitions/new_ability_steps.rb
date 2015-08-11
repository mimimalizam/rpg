When(/^I fill in new ability form$/) do
  fill_in("Name", :with => "speed")
  fill_in("Level", :with => "23")
end

When(/^I click on Create Ability$/) do
  @character.abilities.create!({ :name => "speed", :level => "23" })
  click_button "Create Ability"
end
