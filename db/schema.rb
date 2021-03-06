# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160407205315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "imagen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tallers_count",      default: 0, null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.date     "fecha_inicio"
  end

  create_table "horarios", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "hora_inicio"
  end

  create_table "inscripcions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "taller_id"
    t.integer  "horario_id"
  end

  add_index "inscripcions", ["horario_id"], name: "index_inscripcions_on_horario_id", using: :btree
  add_index "inscripcions", ["taller_id"], name: "index_inscripcions_on_taller_id", using: :btree
  add_index "inscripcions", ["user_id"], name: "index_inscripcions_on_user_id", using: :btree

  create_table "tallers", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "imagen"
    t.string   "lugar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "evento_id"
    t.integer  "cupo"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "tallers", ["evento_id"], name: "index_tallers_on_evento_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                default: "active"
    t.datetime "key_timestamp"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "phone"
    t.boolean  "status",                               default: true
  end

  add_index "users", ["state"], name: "index_users_on_state", using: :btree

end
