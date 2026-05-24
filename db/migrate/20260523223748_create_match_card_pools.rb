class CreateMatchCardPools < ActiveRecord::Migration[8.0]
  def change
    create_table :match_card_pools do |t|
      t.references :match, null: false, foreign_key: true
      t.references :card_template, null: false, foreign_key: true

      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
