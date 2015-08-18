require "rails_helper"

RSpec.describe CharactersController, :type => :controller do

  before do
    @user =  double(User)
    allow(controller).to receive(:current_user) { @user }
    allow(controller).to receive(:authenticate_user!)
  end
  
  describe "POST create" do

    context "successfull new character" do
      before do
        allow(controller).to receive(:current_user) { @user }
        @character = double(Character)
        allow(@user).to receive_message_chain(:characters, :build) { @character }
        allow(@character).to receive(:save) { true}
      end

      it "calls save on character" do
        expect(@character).to receive(:save) { true }
        post character_path(@character), { :name => "Warrior" }
      end

      #it "should redirect to char types" do
      # expect(response).to redirect_to(@character)
      #end
    end
  end
end

