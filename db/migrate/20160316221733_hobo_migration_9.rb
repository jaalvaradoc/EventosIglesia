class HoboMigration9 < ActiveRecord::Migration
  def self.up
    create_table :tallers_users, :id => false do |t|
      t.integer :taller_id
      t.integer :user_id
    end
  end

  
end
