class AbilitiesController < ApplicationController
	def new
		@character = Character.find(params[:character_id])
  	@ability = @character.abilities.build
  	end

  	def create
      debugger
  		@character = Character.find(params[:character_id])
  		#debugger
  		@ability = @character.abilities.build(allowed_params)
  		@ability.save
  		redirect_to character_path(@character)
  	end

    private 
    def allowed_params
      params.require(:ability).permit(:name, :level)
    end
end
