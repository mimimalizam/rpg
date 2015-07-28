class AbilitiesController < ApplicationController
	def new
		@character = Character.find(params[:character_id])
  		@ability = @character.abilities.build
  	end

  	def create
  		@character = Character.find(params[:character_id])
  		debugger
  		@ability = @character.abilities.build(params[:ability])
  		@ability.save
  		redirect_to character_path(@character)
  	end
end
