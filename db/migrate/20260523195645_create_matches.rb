class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.integer :status, default: 0, null: false
      t.integer :current_turn, default: 1
      t.integer :active_player_id

      t.timestamps
    end
  end
end
