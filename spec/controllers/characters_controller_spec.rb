require "rails_helper"

RSpec.describe CharactersController, :type => :controller do

  before do
    @user = double(User)
    allow(controller).to receive(:authenticate_user!)
  end
 
  describe "GET index" do
    let(:characters) { double("characters") } 

    before do
      allow(Character).to receive(:all) { @characters }
      get :index
    end

    it "assigns @characters" do
      expect(assigns(:characters)).to eq(@characters)
    end

    it "renders the index template" do
      expect(response).to render_template('index')
    end

    it { is_expected.to respond_with 200 }
  end

  describe "POST create" do
    before do
      @character = double(Character)
      allow(@character).to receive(:class) { Character }
      allow(controller).to receive(:current_user) { @user }
      allow(@user).to receive_message_chain(:characters, :build) { @character }
    end

    context "successfull new character" do
      before do
        allow(@character).to receive(:save) { true }
      end

      it "calls save on character" do
        expect(@character).to receive(:save) { true }
        post :create, { :character => { :name => "Warrior" } }
      end

      it "redirects to the created Character's page" do 
        post :create, { :character => { :name => "Warrior" } }
        #expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(@character)
      end
    end

    context "unsuccessfull new character" do
      before do
        allow(@character).to receive(:save) { false }
      end

      it "renders template new" do
        post :create, { :character => { :name => "ab" } }
        expect(response).to render_template(:new)
      end
    end
  end
end
