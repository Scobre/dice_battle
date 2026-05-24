class Dice < ApplicationRecord
  belongs_to :player

  has_many :dice_faces, dependent: :destroy
end
