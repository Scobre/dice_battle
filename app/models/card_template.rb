class CardTemplate < ApplicationRecord
  include HasRarity

  has_many :player_cards, dependent: :destroy
  has_many :match_card_pools, dependent: :destroy

  enum :card_type, CARD_TYPE
end
