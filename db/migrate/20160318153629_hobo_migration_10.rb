class HoboMigration10 < ActiveRecord::Migration
  def self.up
    create_table :horarios do |t|
      t.string   :hora_inicio
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :inscripcions, :id => false do |t|
      t.integer :taller_id
      t.integer :user_id
      t.integer :horario_id
    end
  end

  def self.down
    drop_table :horarios
    drop_table :inscripcions
  end
end
