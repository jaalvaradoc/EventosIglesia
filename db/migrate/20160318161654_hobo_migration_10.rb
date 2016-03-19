class HoboMigration10 < ActiveRecord::Migration
  def self.up
    drop_table :tallers_users

    create_table :horarios do |t|
      t.string   :hora_inicio
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :inscripcions do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :taller_id
      t.integer  :horario_id
    end
    add_index :inscripcions, [:user_id]
    add_index :inscripcions, [:taller_id]
    add_index :inscripcions, [:horario_id]
  end

  def self.down
    create_table "tallers_users", id: false, force: true do |t|
      t.integer "taller_id"
      t.integer "user_id"
    end

    drop_table :horarios
    drop_table :inscripcions
  end
end
