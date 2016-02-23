class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :tallers, :cupo, :integer
  end

  def self.down
    remove_column :tallers, :cupo
  end
end
