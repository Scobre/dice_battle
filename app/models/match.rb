class Match < ApplicationRecord
  enum :status, MATCH_STATUS

  belongs_to :active_player, class_name: "Player", optional: true

  has_many :players, dependent: :destroy
  has_many :match_card_pools, dependent: :destroy
  has_many :match_face_pools, dependent: :destroy
  has_many :shop_slots, dependent: :destroy
end
