class MatchFacePool < ApplicationRecord
  belongs_to :match
  belongs_to :face_template
end
