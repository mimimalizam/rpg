Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content("#{message}")
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
