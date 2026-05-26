class MatchService
  def self.create_starter_default(match)
    gold_1 = FaceTemplate.find_by(name: "Gold I")
    gold_2 = FaceTemplate.find_by(name: "Gold II")
    attack_1 = FaceTemplate.find_by(name: "Attack I")
    attack_2 = FaceTemplate.find_by(name: "Attack II")
    mana_1 = FaceTemplate.find_by(name: "Mana I")
    mana_2 = FaceTemplate.find_by(name: "Mana II")
    shield_1 = FaceTemplate.find_by(name: "Shield I")
    shield_2 = FaceTemplate.find_by(name: "Shield II")
    blank = FaceTemplate.find_by(name: "Blank")

    fireball = CardTemplate.find_by(name: "Fireball")
    arcane_study = CardTemplate.find_by(name: "Arcane Study")
    mana_refactor = CardTemplate.find_by(name: "Mana Reactor")
    reinforced_barrier = CardTemplate.find_by(name: "Reinforced Barrier")
    blood_ritual = CardTemplate.find_by(name: "Blood Ritual")
    temporal_echo = CardTemplate.find_by(name: "Temporal Echo")

    face_deck = [
      [gold_1, 10],
      [gold_2, 5],
      [attack_1, 10],
      [attack_2, 5],
      [mana_1, 8],
      [mana_2, 4],
      [shield_1, 8],
      [shield_2, 4]
    ]

    create_face_deck(match, face_deck)

    card_deck = [
      [fireball, 5],
      [arcane_study, 3],
      [mana_refactor, 3],
      [reinforced_barrier, 3],
      [blood_ritual, 3],
      [temporal_echo, 1]
    ]

    create_card_deck(match, card_deck)

    faces = {
      gold_1: gold_1,
      gold_2: gold_2,
      attack_1: attack_1,
      attack_2: attack_2,
      mana_1: mana_1,
      mana_2: mana_2,
      shield_1: shield_1,
      shield_2: shield_2,
      blank: blank
    }

    cards = [
      [fireball, 3],
      [arcane_study, 1]
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
          # zone: :deck,
          # position: index
        )
        index += 1
      end
    end
  end

  def self.create_starter_dice(player, faces)
    starter_faces = [
      [
        faces[:gold_1],
        faces[:gold_1],
        faces[:attack_1],
        faces[:mana_1],
        faces[:shield_1],
        faces[:blank]
      ],
      [
        faces[:gold_1],
        faces[:gold_1],
        faces[:attack_1],
        faces[:mana_1],
        faces[:shield_1],
        faces[:blank]
      ],
      [
        faces[:gold_1],
        faces[:gold_1],
        faces[:attack_1],
        faces[:mana_1],
        faces[:shield_1],
        faces[:blank]
      ],
      [
        faces[:gold_1],
        faces[:gold_1],
        faces[:attack_1],
        faces[:mana_1],
        faces[:shield_1],
        faces[:blank]
      ]
    ]

    starter_faces.each_with_index do |faces, index|
      dice = player.dices.create(
        position: index,
        sides: 6
      )

      faces.each_with_index do |face, face_index|
        dice.dice_faces.create(
          face_template: face,
          position: face_index
        )
      end
    end
  end
end
