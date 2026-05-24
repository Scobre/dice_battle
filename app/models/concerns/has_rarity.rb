module HasRarity
  extend ActiveSupport::Concern

  included do
    enum :rarity, RARITIES
  end
end
