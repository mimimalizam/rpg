When(/^I visit login page$/) do
  visit root_path
end

When(/^fill in my login credentials:$/) do
  fill_in("Username", :with => "John")
  fill_in("Email", :with => "doejohndoe@gmail.com")
  fill_in("Password", :with => "doejohndoe")
end

When(/^I click Sign in button$/) do
  @user = User.create!({
    :username => "John",
    :email => "doejohndoe@gmail.com",
    :password => "doejohndoe"
  })
  click_button "Sign in"
end

Given(/^there is character named "(.*?)"$/) do |char_name|
  user= User.find_by_username("John")
  @character = user.characters.create!({ :name => char_name })
end

When(/^I go to listing characters page$/) do
  visit characters_path
end

Then(/^I should see the "(.*?)" in detail$/) do |char_name|
  expect(page).to have_content("Abilities")
  expect(page).to have_content("#{char_name}")
end
