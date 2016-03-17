class UsersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :index, :new, :create ]

  # Normally, users should be created via the user lifecycle, except
  #  for the initial user created via the form on the front screen on
  #  first run.  This method creates the initial user.
  def create
    hobo_create do
      if valid?
        self.current_user = this
        flash[:notice] = t("hobo.messages.you_are_site_admin", :default=>"You are now the site administrator")
        redirect_to home_page
      end
    end
  end

  def add_taller
    if !params[:taller].blank?
      @taller=Taller.find(params[:taller])
    #@users_tallers = UserTaller.new(:user_id => params[current_user.id], :post_id => params[:post_id])
      if current_user.tallers <<@taller
        flash[:success]="Se ha inscrito satisfactoriamente en el taller #{@taller.nombre}"
      else
        flash[:error]="Ha ocurrido un error al intentar inscribirse en el taller #{@taller.nombre}"
      end
      redirect_to "/eventos/#{params[:evento]}"
    end
  end
  def delete_taller
    if !params[:taller].blank?
      @taller=Taller.find(params[:taller])
      if ActiveRecord::Base.connection.execute("delete from tallers_users where user_id=#{current_user.id} and taller_id=#{params[:taller]}")
        flash[:success]="Se ha retirado satisfactoriamente del taller #{@taller.nombre}"
      else
        flash[:error]="Ha ocurrido un error al intentar retirarse del taller #{@taller.nombre}"
      end
    redirect_to "/users/lista-talleres"
    end
  end 
  #if @users_tallers.save
   # ...
  #else
  #  ...
  #end
end
