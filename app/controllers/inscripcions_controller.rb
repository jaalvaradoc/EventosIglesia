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
	  	if !params[:horario].blank?
	    @horario = Horario.find(params[:horario])
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

  def inscribir
  	@horario=Horario.find(params[:ho])
  	@taller=Taller.find(params[:t])
  	@inscripcion=Inscripcion.new
   	@inscripcion.horario_id = params[:ho]
   	@inscripcion.taller_id = params[:t]
   	@inscripcion.user_id = params[:inscripcion][:user_id]#params[:u]
   	@inscritos=Inscripcion.where(:horario_id=>@horario.id,:taller_id=>@taller.id).count
   	@cupos=Taller.find(@taller.id).cupo
    @usuario=User.find(@inscripcion.user_id)

   	if @cupos>@inscritos
  		if @inscripcion.save
  	    #flash[:success]="Se ha inscrito satisfactoriamente en el taller #{@taller.nombre} con el horario #{@horario.hora_inicio.to_time.strftime("%I:%M %p")}."
  	    if !current_user.administrator?
          flash[:success]="Se ha inscrito satisfactoriamente en el taller #{@taller.nombre} con el horario #{@horario.hora_inicio.to_time.strftime("%I:%M %p")}."
          redirect_to "/tallers/#{@taller.id}"
        else
          flash[:success]="Se ha inscrito satisfactoriamente al usuario #{@usuario.name} en el taller #{@taller.nombre} con el horario #{@horario.hora_inicio.to_time.strftime("%I:%M %p")}."
          redirect_to "/inscripcions/new?taller=#{@taller.id}"
        end
  		else
  	    flash[:error]="Ha ocurrido un error al intentar inscribirse."
  	    redirect_to "/inscripcions/new?taller=#{@taller.id}"
  	  end
    else
    	flash[:error]="No hay cupos disponibles para el taller #{@taller.nombre} en el horario #{@horario.hora_inicio.to_time.strftime("%I:%M %p")}."	
    	redirect_to "/inscripcions/new?taller=#{@taller.id}"
    end
  end

  def listado_asistentes
    if !params[:ta].blank?
      @taller=Taller.find(params[:ta])
    else
      @taller=Taller.all.first
    end
    if !params[:ho].blank?
    @horario=Horario.find(params[:ho])
    else
      @taller=Horario.all.first
    end
    @evento=Evento.find(@taller.evento_id)
    @usuarios=User.joins(:inscripcions).where("inscripcions.taller_id"=>@taller.id,"inscripcions.horario_id"=>@horario.id)

  end
end
