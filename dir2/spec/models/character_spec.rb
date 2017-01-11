require "rails_helper"

describe Character do
  it { should belong_to(:user) }
  it { should have_many(:abilities).dependent(:destroy) }

  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:avatar) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should_not validate_presence_of(:avatar) }
end
