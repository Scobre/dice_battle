class Match < ApplicationRecord
  belongs_to :active_player, class_name: "Player", optional: true
  belongs_to :winner, class_name: "Player", optional: true

  has_many :players, dependent: :destroy
  has_many :match_card_pools, dependent: :destroy
  has_many :match_face_pools, dependent: :destroy
  has_many :shop_slots, dependent: :destroy

  enum :status, MATCH_STATUS
end
