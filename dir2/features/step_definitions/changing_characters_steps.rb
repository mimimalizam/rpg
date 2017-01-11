Given(/^there is a character named Warrior$/) do
  user = User.find_by_username("John")
  @character = user.characters.create!({ :name => "Warrior" })
end

When(/^I click on "(.*?)" link$/) do |link|
  click_link(link)
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

When(/^I fill in new character form$/) do
  fill_in("Name", :with => "Princess")
  image_path = Rails.root + "app/assets/images/princess.gif"
  attach_file("Avatar", image_path)
end

When(/^I click on "(.*?)" button$/) do |button|  
  click_button(button)
end

Then(/^I should see created character$/) do
  expect(page).to have_content("Princess")
end

Then(/^I should see the "(.*?)" in detail$/) do |char_name|
  expect(page).to have_content("Abilities")
  expect(page).to have_content(char_name)
end

When(/^I change character name to Princess$/) do
  fill_in("Name", :with => "Princess")
end

When(/^I click OK$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see the "(.*?)" anymore$/) do |char_name|
  expect(page).to have_no_content(char_name)
end
