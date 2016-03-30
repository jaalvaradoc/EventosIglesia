class InscripcionsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
  	redirect_to "/users/lista-talleres"
  end

end
