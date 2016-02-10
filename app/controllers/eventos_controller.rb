class EventosController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
  	@eventos=Evento.all
  end

  #def show
  #	@evento=Evento.find
  #end

end
