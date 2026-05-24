class DrawCardsService
  HAND_SIZE = 5

  def self.call(player)
    new(player).call
  end

  def initialize(player)
    @player = player
  end

  def call
    missing_cards = HAND_SIZE - player.player_cards.hand.count

    missing_cards.times do
      draw_one_card
    end
  end

  private

  attr_reader :player

  def draw_one_card
    reshuffle_if_needed

    card = player.player_cards
      .deck
      .order(:position)
      .first

    return unless card

    card.update(
      zone: :hand
    )
  end

  def reshuffle_if_needed
    return if player.player_cards.deck.any?

    discard_cards = player.player_cards.discard.to_a.shuffle

    discard_cards.each_with_index do |card, index|
      card.update(
        zone: :deck,
        position: index
      )
    end
  end
end
