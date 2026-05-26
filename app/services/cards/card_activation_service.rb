module Cards
  class CardActivationService
    def self.call(player_card)
      new(player_card).call
    end

    def initialize(player_card)
      @player_card = player_card
      @player = player_card.player
      @template = player_card.card_template
    end

    def call
      return unless playable?

      ActiveRecord::Base.transaction do

        @player.update(
          mana: @player.mana - @template.mana_cost
        )

        applicable_effects.each do |effect|
          apply_effect(effect)
        end

        @player_card.update(
          exhausted: true
        )

      end
    end

    private

    def playable?
      @player.mana >= @template.mana_cost
    end

    def applicable_effects
      @template.effects.select do |effect|
        @player.mastery >=
          effect["mastery_required"].to_i
      end
    end

    def apply_effect(effect)

      case effect["action"]

      when "gain_mastery"

        @player.increment!(
          :mastery,
          effect["value"]
        )

      when "deal_damage"

        opponents.each do |opponent|

          damage =
            effect["value"] - opponent.shield

          damage = [damage, 0].max

          opponent.update(
            shield: [
              opponent.shield - effect["value"],
              0
            ].max,

            health:
              opponent.health - damage
          )

        end
        GameEndService.call(@player.match)

      when "gain_shield"

        @player.increment!(
          :shield,
          effect["value"]
        )

      end
    end

    def opponents
      @player.match.players.where.not(id: @player.id)
    end
  end
end
