class CreateCardTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :card_templates do |t|
      t.string :name, null: false

      t.integer :card_type, null: false

      t.integer :gold_cost, default: 0
      t.integer :mana_cost, default: 0
      t.integer :rarity, default: 0

      # t.boolean :passive, default: false, null: false

      t.jsonb :effects, default: []

      t.timestamps
    end
  end
end
