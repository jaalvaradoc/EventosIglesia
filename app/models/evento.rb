class Evento < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :text
    imagen :string
    tallers_count :integer, :default => 0, :null => false
    timestamps
  end

  attr_accessible :nombre, :descripcion, :lugar, :hora, :imagen, :tallers
  has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }

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
