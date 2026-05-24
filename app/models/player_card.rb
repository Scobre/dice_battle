class PlayerCard < ApplicationRecord
  belongs_to :player
  belongs_to :card_template

  enum :zone, PLAYER_CARD_ZONE
end
