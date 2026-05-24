class MatchService
  def self.create_starter_default(match)
    gold_1 = FaceTemplate.find_by(name: "Gold I")
    gold_2 = FaceTemplate.find_by(name: "Gold II")
    attack_1 = FaceTemplate.find_by(name: "Attack I")
    attack_2 = FaceTemplate.find_by(name: "Attack II")
    mana_1 = FaceTemplate.find_by(name: "Mana I")
    shield_1 = FaceTemplate.find_by(name: "Shield I")
    blank = FaceTemplate.find_by(name: "Blank")

    fireball = CardTemplate.find_by(name: "Fireball")
    meditation = CardTemplate.find_by(name: "Meditation")

    face_deck = [
      [gold_1, 10],
      [gold_2, 5],
      [attack_1, 10],
      [attack_2, 5],
      [mana_1, 8],
      [shield_1, 8]
    ]

    create_face_deck(match, face_deck)

    card_deck = [
      [fireball, 5],
      [meditation, 3]
    ]

    create_card_deck(match, card_deck)

    faces = {
      gold_1: gold_1,
      attack_1: attack_1,
      mana_1: mana_1,
      shield_1: shield_1,
      blank: blank
    }

    cards = [
      [fireball, 3],
      [meditation, 2]
    ]

    match.players.each do |player|
      create_starter_dice(player, faces)
      create_starter_deck(player, cards)
    end
  end

  def self.create_face_deck(match, face_deck)
    face_deck.each do |face, quantity|
      match.match_face_pools.create(
        face_template: face,
        quantity: quantity
      )
    end
  end

  def self.create_card_deck(match, card_deck)
    card_deck.each do |card, quantity|
      MatchCardPool.create(
        match: match,
        card_template: card,
        quantity: quantity
      )
    end
  end

  def self.create_starter_deck(player, cards)
    index = 0
    cards.each do |card, quantity|
      quantity.times do
        player.player_cards.create(
          card_template: card,
          zone: :deck,
          position: index
        )
        index += 1
      end
    end
  end

  def self.create_starter_dice(player, faces)
    4.times do |index|
      dice = player.dices.create(
        position: index,
        sides: 6
      )

      starter_faces = [
        faces[:gold_1],
        faces[:gold_1],
        faces[:attack_1],
        faces[:mana_1],
        faces[:shield_1],
        faces[:blank]
      ]

      starter_faces.each_with_index do |face, face_index|
        dice.dice_faces.create(
          face_template: face,
          position: face_index
        )
      end
    end
  end
end
