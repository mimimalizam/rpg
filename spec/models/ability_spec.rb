require "rails_helper" 

describe Ability do
  it { should belong_to(:character) }

  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:level) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_presence_of(:level) }
  it { should validate_numericality_of(:level) }

  describe "ability levels" do
    before do 
      @ability = Ability.new(:name => "Scepticism", :level => 29)
    end

    describe "#red" do
      context "ability level is above 30" do
        before { @ability.level = 31 }
        it { expect(@ability).not_to be_red }
      end

      context "ability level is below or equal to 30" do
        before {  @ability.level = 29 }
        it { expect(@ability).to be_red }
      end
    end

    describe "#yellow" do
      context "ability level is below or equal to 30 or above 70" do
        before { @ability.level = 79 }
        it { expect(@ability).not_to be_yellow }
      end

      context "ability level is above 30 and below or equal to 70" do
        before { @ability.level = 37 }
        it { expect(@ability).to be_yellow }
      end
    end

    describe "#green" do
      context "ability level is below  70" do
        before { @ability.level = 67 }
        it { expect(@ability).not_to be_green }
      end

      context "ability level is above 70 and below or equal to 100" do
        before { @ability.level = 79 }
        it { expect(@ability).to be_green }
      end
    end
  end
end
