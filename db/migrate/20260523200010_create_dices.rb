class CreateDices < ActiveRecord::Migration[8.0]
  def change
    create_table :dices do |t|
      t.belongs_to :player, null: false, foreign_key: true

      t.integer :position, null: false
      t.integer :sides, default: 6, null: false
      t.integer :last_rolled_face_id

      t.timestamps
    end
  end
end