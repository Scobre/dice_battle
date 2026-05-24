class CreatePlayerCards < ActiveRecord::Migration[8.0]
  def change
    create_table :player_cards do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :card_template, null: false, foreign_key: true

      t.integer :zone, default: 0
      t.integer :position

      t.timestamps
    end
  end
end
