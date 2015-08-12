Given(/^there is a character named Warrior$/) do
  user = User.find_by_username("John")
  @character = user.characters.create!({ :name => "Warrior" })
end

Given(/^character Warrior has ability speed$/) do
  character = Character.find_by_name("Warrior")
  @ability = character.abilities.create!({ :name => "speed", :level => "23" })
end

When(/^I visit Warrior's page$/) do
  character = Character.find_by_name("Warrior")
  visit character_path(@character)
end

When(/^I change ability name to Strength$/) do
  fill_in("Name", :with => "Strength")
end

When(/^I click on "(.*?)" button$/) do |button|  
  click_button(button)
end
