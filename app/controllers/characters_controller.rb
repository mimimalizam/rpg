class CharactersController < ApplicationController
# There are public, private and protected methods in Ruby,
# but only public methods can be actions for controllers.
  def show
    @character = Character.find(params[:id])
  end

  def new
  end

  def create
    @character = Character.new(character_params)
 
    @character.save
    redirect_to @character
  end
  private
  # the method is often made private to make sure
  # it can't be called outside its intended context.
  	def character_params
  		params.require(:character).permit(:name, :avatar)
  	end
end
