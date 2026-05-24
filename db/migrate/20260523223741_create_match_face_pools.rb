class CreateMatchFacePools < ActiveRecord::Migration[8.0]
  def change
    create_table :match_face_pools do |t|
      t.belongs_to :match, null: false, foreign_key: true
      t.belongs_to :face_template, null: false, foreign_key: true

      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
