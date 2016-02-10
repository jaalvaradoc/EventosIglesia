class Taller < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :string
    imagen :string
    hora :string
    lugar :string
    timestamps
  end

  attr_accessible :nombre, :descripcion, :imagen, :hora, :lugar, :evento, :evento_id

  belongs_to :evento, :inverse_of => :tallers, :counter_cache => true

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator? && !evento_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
