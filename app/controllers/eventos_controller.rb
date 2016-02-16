class EventosController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
  	@eventos=Evento.all
  end

  def show
  	@evento=Evento.where("id=?",params[:id]).first

  	@tallers=Taller.where("evento_id=?",@evento.id)
  end


end
