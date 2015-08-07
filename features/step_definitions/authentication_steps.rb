Given(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see welcome message$/) do
  expect(page).to have_content("Mini RPG")
end

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
  expect(page).to have_content("Logout")
end

Given(/^I fill my details and press sign in$/) do
  @user = FactoryGirl.build(:user)

  fill_in('Username', :with => @user.username)
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => @user.password)
  click_button("Sign in")
end

Given(/^I am a valid user$/) do
  @user = FactoryGirl.create(:user)
end

Then(/^I should be signed in$/) do
  expect(page).to have_content("Welcome")
end

Then(/^I should be warned because of invalid credentials$/) do
  expect(page).to have_content("Invalid email or password")
end
