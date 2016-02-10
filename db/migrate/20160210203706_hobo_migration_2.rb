class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :tallers do |t|
      t.string   :nombre
      t.string   :descripcion
      t.string   :imagen
      t.string   :hora
      t.string   :lugar
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :evento_id
    end
    add_index :tallers, [:evento_id]

    add_column :eventos, :tallers_count, :integer, :default => 0, :null => false
    remove_column :eventos, :lugar
    remove_column :eventos, :hora
  end

  def self.down
    remove_column :eventos, :tallers_count
    add_column :eventos, :lugar, :string
    add_column :eventos, :hora, :string

    drop_table :tallers
  end
end
