require "rails_helper"

RSpec.describe CharactersController, :type => :controller do

  before do
    @user = double(User)
    allow(controller).to receive(:authenticate_user!)
  end
 
  describe "GET index" do
    before do
      @character = double(Character)
      allow(Character).to receive(:all) { @characters }
      get :index
    end

    it "assigns @characters" do
      expect(assigns(:characters)).to eq(@characters)
    end

    it "renders template 'index'" do
      expect(response).to render_template('index')
    end

    it "responses with 200" do 
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    before do
      @character = double(Character)
      allow(Character).to receive(:find) { @character }
      get :show, :id => 11
    end

    it "assings character" do
      expect(assigns(:character)).to eq(@character)
    end

    it "renders template 'show'" do
      expect(response).to render_template(:show)
    end

    it "responses with 200" do 
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    before do
      allow(controller).to receive(:current_user) { @user }
      allow(@user).to receive_message_chain(:characters, :build) { @character }
      get :new
    end

    it "renders template 'new'" do
      expect(response).to render_template(:new)
    end
   
    it "responses with 200" do 
      expect(response.status).to eq(200)
    end
  end

  describe "GET edit" do
    before do
      @character = double(Character)
      allow(Character).to receive(:find) { @character }
      get :edit, :id => 11
    end

    it "assings character" do
      expect(assigns(:character)).to eq(@character)
    end

    it "renders template 'edit'" do
      expect(response).to render_template(:edit)
    end

    it "responses with 200" do 
      expect(response.status).to eq(200)
    end

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
        expect(response).to redirect_to(@character)
      end
    end

    context "unsuccessfull new character" do
      before do
        allow(@character).to receive(:save) { false }
      end

      it "renders template 'new'" do
        post :create, { :character => { :name => "ab" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH update" do
    before do
      @character = double(Character)
      allow(Character).to receive(:find) { @character }
    end
     
    context "successfull character update" do
      def do_update
        patch :update, :id => 11, :character => { :name => "Warrior" }
      end

      before do
        allow(@character).to receive(:update) { true }
      end

      it "assigns character" do
        do_update
        expect(assigns(:character)).to eq(@character)
      end

      it "calls update on character" do
        expect(@character).to receive(:update) { true }
        do_update
      end

      it "redirects to updated character's page" do
        do_update
        expect(response).to redirect_to(character_path(@character))
      end
    end

    context "unsuccessfull character update" do
      before do
        allow(@character).to receive(:update) { false }
      end

      it "renders template 'edit'" do
        patch :update, :id => 11, :character => { :name => "Wa" }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @character = double(Character)
      allow(Character).to receive(:find) { @character }
      allow(@character).to receive(:destroy)
    end

    it "assigns character" do
      delete :destroy, :id => 11
      expect(assigns(:character)).to eq(@character)
    end

    it "destroys character" do
      expect(@character).to receive(:destroy)
      delete :destroy, :id => 11
    end

    it "redirects to liting characters page" do
      delete :destroy, :id => 11
      expect(response).to redirect_to(characters_path)
    end
  end
end
