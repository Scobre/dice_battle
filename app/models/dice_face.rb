class DiceFace < ApplicationRecord
  belongs_to :dice
  belongs_to :face_template
end
