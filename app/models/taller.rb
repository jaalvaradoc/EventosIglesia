class Taller < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :string
    imagen :string
    hora :string
    lugar :string
    cupo :integer
    timestamps
  end

  attr_accessible :nombre, :descripcion, :imagen,:cover, :hora, :lugar, :cupo, :evento, :evento_id

  has_attached_file :cover, styles: {medium: "1280x720", thumb:"250x250"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

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
