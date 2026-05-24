# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_05_23_223748) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "card_templates", force: :cascade do |t|
    t.string "name", null: false
    t.integer "card_type", null: false
    t.integer "cost", default: 0
    t.integer "rarity", default: 0
    t.jsonb "effects", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dice_faces", force: :cascade do |t|
    t.bigint "dice_id", null: false
    t.bigint "face_template_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dice_id"], name: "index_dice_faces_on_dice_id"
    t.index ["face_template_id"], name: "index_dice_faces_on_face_template_id"
  end

  create_table "dices", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "position", null: false
    t.integer "sides", default: 6, null: false
    t.integer "last_rolled_face_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_dices_on_player_id"
  end

  create_table "face_templates", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon", null: false
    t.integer "face_type", null: false
    t.integer "value", default: 0
    t.integer "rarity", default: 0
    t.integer "cost", default: 0
    t.jsonb "tags", default: []
    t.jsonb "effects", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_card_pools", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "card_template_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_match_card_pools_on_card_template_id"
    t.index ["match_id"], name: "index_match_card_pools_on_match_id"
  end

  create_table "match_face_pools", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "face_template_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["face_template_id"], name: "index_match_face_pools_on_face_template_id"
    t.index ["match_id"], name: "index_match_face_pools_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.integer "current_turn", default: 1
    t.integer "active_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_cards", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "card_template_id", null: false
    t.integer "zone", default: 0
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_player_cards_on_card_template_id"
    t.index ["player_id"], name: "index_player_cards_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.string "name", null: false
    t.integer "health", default: 20, null: false
    t.integer "mastery", default: 0, null: false
    t.integer "gold", default: 0, null: false
    t.integer "mana", default: 0, null: false
    t.integer "shield", default: 0, null: false
    t.boolean "has_rolled", default: false, null: false
    t.jsonb "last_roll_results", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_players_on_match_id"
  end

  create_table "shop_slots", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "card_template_id"
    t.bigint "face_template_id"
    t.integer "slot_type", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_shop_slots_on_card_template_id"
    t.index ["face_template_id"], name: "index_shop_slots_on_face_template_id"
    t.index ["match_id"], name: "index_shop_slots_on_match_id"
  end

  add_foreign_key "dice_faces", "dices"
  add_foreign_key "dice_faces", "face_templates"
  add_foreign_key "dices", "players"
  add_foreign_key "match_card_pools", "card_templates"
  add_foreign_key "match_card_pools", "matches"
  add_foreign_key "match_face_pools", "face_templates"
  add_foreign_key "match_face_pools", "matches"
  add_foreign_key "player_cards", "card_templates"
  add_foreign_key "player_cards", "players"
  add_foreign_key "players", "matches"
  add_foreign_key "shop_slots", "card_templates"
  add_foreign_key "shop_slots", "face_templates"
  add_foreign_key "shop_slots", "matches"
end
