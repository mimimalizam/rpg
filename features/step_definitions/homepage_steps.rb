Given(/^I am on the homepage$/) do
	visit root_path 
end

Then(/^I should see welcme message$/) do
	expect(page).to have_content("Mini RPG")
end
