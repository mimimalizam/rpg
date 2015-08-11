Given(/^character Warrior has ability speed$/) do
  character = Character.find_by_name("Warrior")
  @ability = character.abilities.create!({ :name => "speed", :level => "23" })
end
