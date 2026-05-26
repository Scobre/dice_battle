class CreateFaceTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :face_templates do |t|
      t.string :name, null: false
      t.string :icon, null: false

      t.integer :face_type, null: false
      t.integer :value, default: 0

      t.integer :rarity, default: 0
      t.integer :gold_cost, default: 0

      t.jsonb :tags, default: []
      t.jsonb :effects, default: []

      t.timestamps
    end
  end
end
