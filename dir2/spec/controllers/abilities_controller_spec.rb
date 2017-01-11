require "rails_helper"

RSpec.describe AbilitiesController, :type => :controller do
  before do
    @user = double(User)
    allow(controller).to receive(:authenticate_user!)
    @character = double(Character)
    allow(Character).to receive(:find) { @character }
  end

  describe "GET new" do
    before do
      allow(@character).to receive_message_chain(:abilities, :build) { @ability }
      get :new, :character_id => 13
    end

    it "assigns @character" do
      expect(assigns(:character)).to eq(@character)
    end

    it "assigns @ability" do
      expect(assigns(:ability)).to eq(@ability)
    end

    it "renders template 'new'" do
      expect(response).to render_template("new")
    end

    it "respondes with 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET edit" do
    before do
      @ability = double(Ability)
      allow(Ability).to receive(:find) { @ability }
      get :edit, :character_id => 11, :id => 13 
    end

    it "assigns @character" do
      expect(assigns(:character)).to eq(@character)
    end

    it "assigns @ability" do
      expect(assigns(:ability)).to eq(@ability)
    end

    it "renders template 'edit'" do
      expect(response).to render_template("edit")
    end

    it "respondes with 200" do
      expect(response.status).to eq(200)
    end
  end
  
  describe "POST create" do
    let(:ability_params) { { "name" => "Speed", "level" => "17" } }
    
    before do
      @ability = double(Ability)
      allow(@character).to receive_message_chain(:abilities, :build) { @ability }
      allow(@ability).to receive(:save)
      allow(@character).to receive(:class) { Character }
    end
    
    it "assigns @character" do
      post :create, :character_id => 11,
        :ability => ability_params
      expect(assigns(:character)).to eq(@character)
    end
   
    it "calls save on ability" do
      expect(@ability).to receive(:save)
      post :create, :character_id => 11, :ability => ability_params
    end

    context "successfull new ability" do
      before do
        allow(@ability).to receive(:save) { true }
      end
      
      it "redirects to the character's page" do
         post :create, :character_id => 11, :ability => ability_params
         expect(response).to redirect_to(@character)
      end
      
      it "builds entered ability" do
        expect(@character).to receive_message_chain(:abilities, :build).with(ability_params)
        post :create, :character_id => 11, :ability => ability_params
      end
    end

    context "unsuccessfull new ability" do
      before do
        allow(@ability).to receive(:save) { false }
      end

      it "renders template 'new'" do
        post :create, :character_id => 11, :ability => ability_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:ability_params) { { "name" => "Speed", "level" => "17" } }

    before do
      @ability = double(Ability)
      allow(Ability).to receive(:find) { @ability }
      allow(@ability).to receive(:update)
      allow(@character).to receive(:class) { Character }
    end

    it "calls update on ability" do
      expect(@ability).to receive(:update)
      put :update, :character_id => 11, :id => 13, :ability => ability_params
    end

    context "successfull character's ability update" do

      before do
        allow(@ability).to receive(:update) { true }
      end

      it "assigns @character" do
        put :update, :character_id => 11, :id => 13, :ability => ability_params
        expect(assigns(:character)).to eq(@character)
      end

      it "redirects to updated character's page" do
        put :update, :character_id => 11, :id => 13, :ability => ability_params
        expect(response).to redirect_to(character_path(@character))
      end
    end

    context "unsuccessfull character's ability update" do
      before do
        allow(@ability).to receive(:update) { false }
      end

      it "renders template 'edit'" do
        put  :update, :character_id => 11, :id => 13, :ability => { :name => "Wa" }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @ability = double(Ability)
      allow(Ability).to receive(:find) { @ability }
      allow(@ability).to receive(:destroy)
      allow(@character).to receive(:class) { Character }
    end

    it "assigns @character" do
      delete :destroy, :character_id => 11, :id => 13
      expect(assigns(:character)).to eq(@character)
    end

    it "assigns ability" do
      delete :destroy, :character_id => 11, :id => 13
      expect(assigns(:ability)).to eq(@ability)
    end

    it "destroys ability" do
      expect(@ability).to receive(:destroy)
      delete :destroy, :character_id => 11, :id =>13
    end

    it "redirects to character's page" do
      delete :destroy, :character_id => 11, :id => 13
      expect(response).to redirect_to(character_path(@character))
    end
  end
end
