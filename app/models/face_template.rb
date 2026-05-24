class FaceTemplate < ApplicationRecord
  include HasRarity

  has_many :dice_faces, dependent: :destroy
  has_many :match_face_pools, dependent: :destroy

  enum :face_type, FACE_TYPE
end
