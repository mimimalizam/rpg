class AbilitiesController < ApplicationController
  def new
    @character = Character.find(params[:character_id])
    @ability = @character.abilities.build
  end

  def edit
    @character = Character.find(params[:character_id])
    @ability = Ability.find(params[:id])
  end

  def create
    @character = Character.find(params[:character_id])
    @ability = @character.abilities.build(allowed_params)
    @ability.save
    redirect_to character_path(@character)
  end

  def update
    @character = Character.find(params[:character_id])
    @ability = Ability.find(params[:id])

    if @ability.update(allowed_params)
      redirect_to @character
    else
      render 'edit'
    end
  end

  def destroy
    @character = Character.find(params[:character_id])
    @ability = Ability.find(params[:id])
    @ability.destroy

    redirect_to @character
  end


  private
  def allowed_params
    params.require(:ability).permit(:name, :level)
  end
end
