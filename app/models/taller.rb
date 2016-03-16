class Taller < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string
    descripcion :string
    imagen :string
    lugar :string
    cupo :integer
    timestamps
  end

  attr_accessible :nombre, :descripcion, :imagen,:cover, :lugar, :cupo, :evento, :evento_id

  has_attached_file :cover, styles: {medium: "1280x720", thumb:"250x250"}, :storage => :s3,:s3_region => 'us-east-1', :s3_credentials => Proc.new{|a| a.instance.s3_credentials}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  belongs_to :evento, :inverse_of => :tallers, :counter_cache => true


  def s3_credentials
    {:bucket => "ciaeventos", :access_key_id => "AKIAJLCMNNSWMSVQ4WSA", :secret_access_key => "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"}
  end

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
