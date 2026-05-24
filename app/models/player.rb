class Player < ApplicationRecord
  belongs_to :match

  has_many :dices, dependent: :destroy
  has_many :player_cards, dependent: :destroy
end
