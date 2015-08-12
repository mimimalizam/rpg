When(/^I fill in new ability form$/) do
  fill_in("Name", :with => "speed")
  fill_in("Level", :with => "23")
end
