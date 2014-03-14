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

ActiveRecord::Schema.define(version: 20140313173016) do

  create_table "admins", force: true do |t|
    t.string   "usuario"
    t.string   "nombre"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cajeros", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cajeros", ["email"], name: "index_cajeros_on_email", unique: true
  add_index "cajeros", ["reset_password_token"], name: "index_cajeros_on_reset_password_token", unique: true

  create_table "categorias", force: true do |t|
    t.string   "nombre"
    t.integer  "edad_hasta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costo_por_categorias", force: true do |t|
    t.float    "costo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria_id"
    t.integer  "periodo_id"
  end

  create_table "deudas", force: true do |t|
    t.float    "monto"
    t.boolean  "pagada"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "socio_id"
    t.integer  "periodo_id"
  end

  add_index "deudas", ["periodo_id"], name: "index_deudas_on_periodo_id"
  add_index "deudas", ["socio_id"], name: "index_deudas_on_socio_id"

  create_table "pagos", force: true do |t|
    t.float    "monto"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deuda_id"
  end

  add_index "pagos", ["deuda_id"], name: "index_pagos_on_deuda_id"

  create_table "periodos", force: true do |t|
    t.string   "nombre"
    t.date     "fecha_vencimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rols", force: true do |t|
    t.string   "nombre"
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
    t.integer  "categoria_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rol_id"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
