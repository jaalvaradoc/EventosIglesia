class Evento < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :text
    imagen :string
    tallers_count :integer, :default => 0, :null => false
    timestamps
  end

  attr_accessible :nombre, :descripcion, :imagen, :tallers, :cover

  has_attached_file :cover, styles: {medium: "1280x720", thumb:"250x250"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  
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
