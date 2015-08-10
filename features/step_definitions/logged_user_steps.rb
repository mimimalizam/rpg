When(/^I go to the login page$/) do
  visit user_session_path
end

When(/^fill in my login credentials$/) do
  fill_in("Username", :with => "John") 
  fill_in("Email", :with => "doejohndoe@gmail.com") 
  fill_in("Password", :with => "doejohndoe")
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content("#{message}")
end

When(/^I click Sign in$/) do
  @user = User.create!({
    :username => "John",
    :email => "doejohndoe@gmail.com",
    :password => "doejohndoe"
  })
  click_button "Sign in"
end

When(/^I click on "(.*?)" link$/) do |link|
  click_link "#{link}"
end

When(/^I click on Create Character$/) do
  @character = @user.characters.build
  click_button "Create Character"
end

When(/^I fill in new character form$/) do
  fill_in("Name", :with => "Princess")
  image_path = Rails.root + "app/assets/images/princess.gif"
  attach_file("Avatar", image_path)
end

Then(/^I should see created character$/) do
 expect(page).to have_content(@character.name)
end
