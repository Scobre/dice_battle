class ShopSlot < ApplicationRecord
  belongs_to :match
  belongs_to :card_template, optional: true
  belongs_to :face_template, optional: true

  enum :slot_type, SLOT_TYPE
end
