class HorariosController < ApplicationController

  hobo_model_controller

  auto_actions :all

 def crear_horario
 	@horario=Horario.new
 	@horario.hora_inicio= (params[:horario]["hora_inicio(4i)"].to_i-6).to_s+":"+params[:horario]["hora_inicio(5i)"].to_s
	if @horario.save
    	flash[:success]="Se ha creado satisfactoriamente el horario: #{@horario.hora_inicio.to_time.strftime("%I:%M %p")}."
	else
    	flash[:error]="Ha ocurrido un error al intentar crear el horario."
  	end
	redirect_to "/horarios"

 end


end
