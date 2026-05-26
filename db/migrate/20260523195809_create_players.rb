class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.belongs_to :match, null: false, foreign_key: true

      t.string :name, null: false
      t.integer :position, default: 0, null: false

      t.integer :health, default: 20, null: false
      t.integer :mastery, default: 0, null: false

      t.integer :gold, default: 0, null: false
      t.integer :mana, default: 0, null: false
      t.integer :shield, default: 0, null: false

      t.boolean :has_rolled, default: false, null: false

      t.jsonb :last_roll_results, default: []

      t.timestamps
    end
  end
end
