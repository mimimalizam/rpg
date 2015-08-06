When(/^I go to the login page$/) do
  visit user_session_path
end

When(/^fill in my login credentials:$/) do
  fill_in('Username', :with => 'John') 
  fill_in('Email', :with => 'doejohndoe@gmail.com') 
  fill_in('Password', :with => 'doejohndoe')
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content("#{message}")
end

When(/^I click "(.*?)"$/) do |button|
  @user = User.create!({
      :username => "John",
      :email => "doejohndoe@gmail.com",
      :password => "doejohndoe"
  })
  click_button button
end

When(/^I click on "(.*?)" link$/) do |link|
  click_link("#{link}")
end
