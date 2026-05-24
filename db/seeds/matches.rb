class Seeder
  def self.seed_matches
    puts "Creating matches..."

    matches = [
      {
        status: :playing,
        current_turn: 1
      }
    ]

    Match.create(matches)
  end
end
