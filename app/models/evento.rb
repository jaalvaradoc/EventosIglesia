class Evento < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :text
    imagen :string
    tallers_count :integer, :default => 0, :null => false
    timestamps
  end

  attr_accessible :nombre, :descripcion, :imagen, :tallers

  has_many :tallers, :dependent => :destroy, :inverse_of => :evento

  children :tallers



  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

  
end
