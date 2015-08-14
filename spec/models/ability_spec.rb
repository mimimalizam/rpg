require "rails_helper" 

describe Ability do
  it { should belong_to(:character) }

  it { should have_db_column(:name) }
  it { should have_db_column(:level) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_presence_of(:level) }
  it { should validate_numericality_of(:level) }

  before do 
    @ability_one = Ability.new(:name => "Scepticism", :level => "29")
    @ability_one.save

    @ability_two = Ability.new(:name => "Doubtfulness", :level => "47")
    @ability_two.save

    @ability_three = Ability.new(:name => "Askance", :level => "91")
    @ability_three.save
  end

  describe "#red" do
    it { expect(@ability_one.red?).to eq(true) }
    it { expect(@ability_two.red?).to eq(false) }
  end
  
  describe "#yellow" do
    it { expect(@ability_one.yellow?).to eq(false) }
    it { expect(@ability_two.yellow?).to eq(true) }
    it { expect(@ability_three.yellow?).to eq(false) }
  end

  describe "#green" do
    it { expect(@ability_one.green?).to eq(false) }
    it { expect(@ability_three.green?).to eq(true) }
  end
end
