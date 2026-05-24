class CreateDiceFaces < ActiveRecord::Migration[8.0]
  def change
    create_table :dice_faces do |t|
      t.belongs_to :dice, null: false, foreign_key: true
      t.belongs_to :face_template, null: false, foreign_key: true

      t.integer :position, null: false

      t.timestamps
    end
  end
end
