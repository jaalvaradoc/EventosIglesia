class InscripcionsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
  	redirect_to "/users/lista-talleres"
  end
  def new
  	#@taller=Taller.find(params[:taller])
  	#hobo_new

  	hobo_new do
	  	
	  	if Taller.exists?(params[:taller])
	  		@taller=Taller.find(params[:taller])
	  	if !params[:project].blank?
	    @horario = Horario.find(params[:project])
	    else 
	    @horario = Horario.all.first
	    end
		else
			redirect_to "/"
		end
	end
  end

  def horarioseleccionado
  	hor=Horario.find(params[:horario])

  	render :update do |page|
  		page.replace_html 'cupos', :partial=>'cupos', :object=>hor
  	end
  end


end
