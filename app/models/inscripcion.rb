class Inscripcion < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
  attr_accessible
  attr_accessible :user, :user_id, :taller, :taller_id, :horario, :horario_id 

  belongs_to :user, :inverse_of => :inscripcions
  belongs_to :taller, :inverse_of => :inscripcions
  belongs_to :horario, :inverse_of => :inscripcions

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
