class HoboMigration12 < ActiveRecord::Migration
  def self.up
    add_column :eventos, :fecha_inicio, :date
  end

  def self.down
    remove_column :eventos, :fecha_inicio
  end
end
