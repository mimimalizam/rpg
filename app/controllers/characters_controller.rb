class CharactersController < ApplicationController
# There are public, private and protected methods in Ruby,
# but only public methods can be actions for controllers.
  def index
    @characters = Character.all    
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
  	@character = Character.new
  end

  def edit
  	@acharacter = Character.find(params[:id])
  end

  def create
    @character = Character.new(character_params)
 
    if @character.save
    	redirect_to @character
    else
    	render 'new'
    end
  end

  def update
  	@character = Character.find(params[:id])
 
  	if @character.update(character_params)
   		redirect_to @character
 	else
    	render 'edit'
    end
end

  private
  	def character_params
  		params.require(:character).permit(:name, :avatar)
  	end
end
