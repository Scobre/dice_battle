class MatchCardPool < ApplicationRecord
  belongs_to :match
  belongs_to :card_template
end
