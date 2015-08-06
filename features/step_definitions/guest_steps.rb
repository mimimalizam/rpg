Given(/^I am not signed in$/) do
  visit root_path
  expect(page).to have_content("Login")
end

When(/^I visit "(.*?)"$/) do |arg1|
    visit "/#{arg1}"
end

Then(/^I should see "(.*?)" message$/) do |arg1|
  expect(page).to have_content("#{arg1}")
end
