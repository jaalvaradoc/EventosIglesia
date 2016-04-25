class HoboMigration11 < ActiveRecord::Migration
  def self.up
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone, :string
    add_column :users, :status, :boolean, :default => true
    remove_column :horarios, :hora_inicio
    add_column :horarios, :hora_inicio, :time, :limit => nil
  end

  def self.down
    remove_column :users, :gender
    remove_column :users, :birth_date
    remove_column :users, :phone
    remove_column :users, :status

    change_column :horarios, :hora_inicio, :string
  end
end
