class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :tallers, :extension, :string
  end

  def self.down
    remove_column :tallers, :extension
  end
end
