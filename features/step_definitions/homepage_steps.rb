Given(/^I am on the homepage$/) do
	visit root_path
end

Then(/^I should see welcme message$/) do
	expect(page).to have_content("Mini RPG")
end

###

Given(/^I follow sign up link$/) do
  click_link("Register")
end

Given(/^I fill my details and press register$/) do
  fill_in('Username', :with => 'John')
  fill_in('Email', :with => 'john@doe.com')
  fill_in('Password', :with => 'mypassword')
  fill_in('Password confirmation', :with => 'mypassword')
  click_button("Sign up")
end

Then(/^I should be signed up$/) do
  expect(page).to have_content("You have signed up successfully")
end
