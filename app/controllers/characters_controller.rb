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
    @character = current_user.characters.build
  end

  def edit
    @character = Character.find(params[:id])
  end

  def create
    @character = current_user.characters.build(character_params)

    if @character.save
      redirect_to character_path(@character)
    else
      render 'new'
    end
  end

  def update
    @character = Character.find(params[:id])

    if @character.update(character_params)
      redirect_to character_path(@character)
    else
      render 'edit'
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to characters_path 
  end

  private
  def character_params
    params.require(:character).permit(:name, :avatar)
  end
end
