class CharactersController < ApplicationController
# There are public, private and protected methods in Ruby,
# but only public methods can be actions for controllers.v
  def new
  end

  def create
  	render plain: params[:character].inspect
  end

end
