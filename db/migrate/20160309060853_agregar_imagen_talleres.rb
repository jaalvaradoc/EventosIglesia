class AgregarImagenTalleres < ActiveRecord::Migration
  def change
  	add_attachment :tallers, :cover
  end
end
