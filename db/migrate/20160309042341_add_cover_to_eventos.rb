class AddCoverToEventos < ActiveRecord::Migration
  def change
  	add_attachment :eventos, :cover
  end
end
