class HoboMigration6 < ActiveRecord::Migration
  def self.up
    remove_column :eventos, :extension

    remove_column :tallers, :extension
  end

  def self.down
    add_column :eventos, :extension, :string

    add_column :tallers, :extension, :string
  end
end
