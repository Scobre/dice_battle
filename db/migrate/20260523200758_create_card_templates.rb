class CreateCardTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :card_templates do |t|
      t.string :name, null: false

      t.integer :card_type, null: false

      t.integer :cost, default: 0
      t.integer :rarity, default: 0

      t.jsonb :effects, default: []

      t.timestamps
    end
  end
end
