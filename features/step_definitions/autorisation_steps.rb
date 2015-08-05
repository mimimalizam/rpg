Given(/^I am on the homepage$/) do
	visit root_path
end

Then(/^I should see welcme message$/) do
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
  expect(page).to have_content("You have signed up successufully")
end

Given(/^I fill my details and press sign in$/) do
  fill_in('Username', :with => 'John')
  fill_in('Email', :with => 'john@doe.com')
  fill_in('Password', :with => 'mypassword')
  click_button("Sign in")
end

Given(/^I am a valid user$/) do
  @user = User.create!({
    :username => "John",
    :email => "john@doe.com",
    :password => "mypassword"
  })
end

Then(/^I should be signed in$/) do
  page.has_content?("Signed in successufully")
end

Then(/^I should be warned because of invalid sign in$/) do
  page.has_content?("Invalid email or password")
end

