Given(/^I am logged in$/) do
  visit root_path
  fill_in("Username", :with => "John") 
  fill_in("Email", :with => "doejohndoe@gmail.com") 
  fill_in("Password", :with => "doejohndoe")
  @user = User.create!({
    :username => "John",
    :email => "doejohndoe@gmail.com",
    :password => "doejohndoe"
  })
  click_button "Sign in"
end

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
  click_button "#{button}"
end
