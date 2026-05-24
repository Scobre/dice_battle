class PlayCardService
  def self.call(player_card)
    new(player_card).call
  end

  def initialize(player_card)
    @player_card = player_card
  end

  def call
    apply_effects

    player_card.update(
      zone: :in_play
    )
  end

  private

  attr_reader :player_card

  def player
    player_card.player
  end

  def effects
    player_card.card_template.effects
  end

  def apply_effects
    effects.each do |effect|
      case effect["action"]

      when "deal_damage"
        # bientôt

      when "gain_gold"
        player.increment!(
          :gold,
          effect["value"]
        )

      when "gain_mana"
        player.increment!(
          :mana,
          effect["value"]
        )
      end
    end
  end
end
