class CharactersController < ApplicationController
# There are public, private and protected methods in Ruby,
# but only public methods can be actions for controllers.v
  def new
  end

  def create
  	# capital Character,
  	# we are referring to the class named Character defined in models
    @character = Character.new(params[:character])
 
    # to save the model in the db: 
    @character.save
    redirect_to @character
  end
end
