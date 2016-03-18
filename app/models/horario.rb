class Horario < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    hora_inicio :string
    timestamps
  end
  attr_accessible :hora_inicio
  has_and_belongs_to_many :tallers
  has_and_belongs_to_many :users
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
