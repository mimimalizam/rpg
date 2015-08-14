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
        before do 
          @ability.level = 31
        end
        it { expect(@ability.red?).to eq(false) }
      end

      context "ability level is below or equal to 30" do
        before do
          @ability.level = 29
        end
        it { expect(@ability.red?).to eq(true) }
      end
    end

    describe "#yellow" do
      context "ability level is below or equal to 30 or above 70" do
        before do
          @ability.level = 79
        end
        it { expect(@ability.yellow?).to eq(false) }
      end

      context "ability level is above 30 and below or equal to 70" do
        before do
          @ability.level = 37
        end
        it { expect(@ability.yellow?).to eq(true) }
      end
    end

    describe "#green" do
      context "ability level is below  70" do
        before do 
          @ability.level = 67
        end
        it { expect(@ability.green?).to eq(false) }
      end

      context "ability level is above 70 and below or equal to 100" do
        before do
          @ability.level = 79
        end
        it { expect(@ability.green?).to eq(true) }
      end
    end
  end
end
