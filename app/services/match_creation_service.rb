class MatchCreationService
  PLAYER_NAMES = [
    "Alice",
    "Bob",
    "Charlie",
    "Diana",
    "Eve",
    "Frank"
  ]

  def self.call(player_count:)
    new(player_count).call
  end

  def initialize(player_count)
    @player_count = player_count.clamp(2, 6)
  end

  def call
    match = create_match

    create_players(match)

    match.update(active_player: match.players.first)
    
    DrawCardsService.call(match.players.first)

    ShopRefillService.call(match)

    match
  end

  private

  attr_reader :player_count

  def create_match
    Match.create(
      status: :playing,
      current_turn: 1
    )
  end

  def create_players(match)
    player_count.times do |index|
      player = match.players.create(
        name: PLAYER_NAMES[index]
      )
    end

    MatchService.create_starter_default(match)
  end
end
