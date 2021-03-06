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

ActiveRecord::Schema.define(version: 2018_09_12_163316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deputados", force: :cascade do |t|
    t.integer "cod_dep"
    t.string "uri"
    t.string "nome"
    t.string "sigla_partido"
    t.string "uri_partido"
    t.string "sigla_uf"
    t.integer "id_legislatura"
    t.string "url_foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
