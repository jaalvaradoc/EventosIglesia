class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :eventos, :extension, :string
  end

  def self.down
    remove_column :eventos, :extension
  end
end
