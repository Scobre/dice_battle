class GameEndService

  def self.call(match)
    new(match).call
  end

  def initialize(match)
    @match = match
  end

  def call

    alive_players =
      @match.players.where("health > 0")

    return unless alive_players.count == 1

    @match.update(
      status: :finished,
      winner: alive_players.first
    )

  end

end
