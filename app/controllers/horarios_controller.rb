class HorariosController < ApplicationController

  hobo_model_controller

  auto_actions :all

 def crear_horario
 	@horario=Horario.new
 	@hora=0
 	if params[:horario]["hora_inicio(4i)"].to_i > 17
 		@hora=params[:horario]["hora_inicio(4i)"].to_i-18
 	else
 		@hora=params[:horario]["hora_inicio(4i)"].to_i+6
 	end
 	@horario.hora_inicio= (@hora).to_s+":"+params[:horario]["hora_inicio(5i)"].to_s
	if @horario.save
    	flash[:success]="Se ha creado satisfactoriamente el horario: #{@horario.hora_inicio.to_time.strftime("%I:%M %p")}."
	else
    	flash[:error]="Ha ocurrido un error al intentar crear el horario."
  	end
	redirect_to "/horarios"

 end


end
