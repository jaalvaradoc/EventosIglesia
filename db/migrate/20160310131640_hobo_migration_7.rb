class HoboMigration7 < ActiveRecord::Migration
  def self.up
    remove_column :tallers, :hora
  end

  def self.down
    add_column :tallers, :hora, :string
  end
end
