class CreateShopSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :shop_slots do |t|
      t.belongs_to :match, null: false, foreign_key: true

      t.belongs_to :card_template, foreign_key: true
      t.belongs_to :face_template, foreign_key: true

      t.integer :slot_type, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
