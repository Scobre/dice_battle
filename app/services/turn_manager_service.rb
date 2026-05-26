class TurnManagerService
  def self.next_turn(match)
    new(match).next_turn
  end

  def initialize(match)
    @match = match
  end

  def next_turn
    current_player = match.active_player

    cleanup_end_of_turn(current_player)
    # cleanup_cards(current_player)

    next_player = determine_next_player

    cleanup_start_of_turn(next_player)
    # DrawCardsService.call(next_player)

    match.update(
      active_player: next_player,
      current_turn: match.current_turn + 1
    )
  end

  private

  attr_reader :match

  def determine_next_player
    players = match.players.where.not(health: 0).order(:id)

    current_index = players.index(match.active_player)

    players[(current_index + 1) % players.length]
  end

  def cleanup_cards(player)
    player.player_cards.hand.each do |card|
      card.update(zone: :discard)
    end

    player.player_cards.in_play.each do |card|
      card.update(zone: :discard)
    end
  end

  def cleanup_end_of_turn(player)
    player.update(
      gold: 0,
      mana: 0
    )
  end

  def cleanup_start_of_turn(player)
    player.update(
      shield: 0,
      has_rolled: false,
      last_roll_results: []
    )
    player.player_cards.update_all(
      exhausted: false
    )
  end
end
