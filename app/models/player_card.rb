class PlayerCard < ApplicationRecord
  belongs_to :player
  belongs_to :card_template

  # enum :zone, PLAYER_CARD_ZONE
  scope :available, -> {
    where(
      exhausted: false,
      active: true
    ).where(
      "cooldown <= 0"
    )
  }
end
