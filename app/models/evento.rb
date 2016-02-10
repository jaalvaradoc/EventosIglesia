class Evento < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :text
    lugar :string
    hora :string
    imagen :string
    timestamps
  end
  attr_accessible :nombre, :descripcion, :lugar, :hora, :imagen

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
