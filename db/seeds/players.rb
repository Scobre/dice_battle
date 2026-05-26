class Seeder
  def self.seed_players
    puts "Creating players..."

    match = Match.first

    players = [
      {
        match: match,
        name: "Alice",
        position: 0
      },
      {
        match: match,
        name: "Bob",
        position: 1
      }
    ]

    Player.create(players)

    MatchService.create_starter_default(match)
    match.update(active_player: match.players.first)

    ShopRefillService.call(match)
    # DrawCardsService.call(match.players.first)
  end
end
