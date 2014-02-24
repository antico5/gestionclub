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

ActiveRecord::Schema.define(version: 20140224135815) do

  create_table "admins", force: true do |t|
    t.string   "usuario"
    t.string   "nombre"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoria", force: true do |t|
    t.string   "nombre"
    t.integer  "edad_hasta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costo_por_categoria", force: true do |t|
    t.float    "costo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deudas", force: true do |t|
    t.float    "monto"
    t.boolean  "pagada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagos", force: true do |t|
    t.float    "monto"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodos", force: true do |t|
    t.string   "nombre"
    t.date     "fecha_vencimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socios", force: true do |t|
    t.string   "nombre"
    t.string   "dni"
    t.string   "domicilio"
    t.string   "email"
    t.date     "fecha_alta"
    t.date     "fecha_baja"
    t.text     "comentario"
    t.boolean  "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
