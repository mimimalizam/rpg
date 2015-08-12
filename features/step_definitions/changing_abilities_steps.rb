Given(/^character Warrior has ability speed$/) do
  character = Character.find_by_name("Warrior")
  @ability = character.abilities.create!({ :name => "speed", :level => "23" })
end

When(/^I visit Warrior's page$/) do
  character = Character.find_by_name("Warrior")
  visit character_path(@character)
end

When(/^I fill in new ability form$/) do
    fill_in("Name", :with => "speed")
    fill_in("Level", :with => "23")
end

When(/^I change ability name to Strength$/) do
  fill_in("Name", :with => "Strength")
end
