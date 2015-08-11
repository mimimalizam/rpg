When(/^I visit listing characters page$/) do
  visit characters_path
end

Then(/^I should see the "(.*?)" in detail$/) do |char_name|
  expect(page).to have_content("Abilities")
  expect(page).to have_content("#{char_name}")
end

When(/^I change character name to Princess$/) do
  fill_in("Name", :with => "Princess")
end

Then(/^I should not see the "(.*?)" anymore$/) do |char_name|
  expect(page).to have_no_content("#{char_name}")
end

When(/^I click OK$/) do
  page.driver.browser.switch_to.alert.accept
end
