class Horario < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    hora_inicio :time,:unique, :required
    timestamps
  end
  attr_accessible :hora_inicio

  has_many :inscripcions, :dependent => :destroy, :inverse_of =>:horario
  has_many :tallers, :through =>:inscripcions
  has_many :users, :through =>:inscripcions

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
