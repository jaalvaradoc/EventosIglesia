class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.string   :nombre
      t.text     :descripcion
      t.string   :lugar
      t.string   :hora
      t.string   :imagen
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :eventos
  end
end
