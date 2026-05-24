class Seeder
  def self.seed_card_templates
    puts "Creating card templates..."

    card_templates = [
      {
        name: "Fireball",
        card_type: :spell,#CardTemplate::card_types[:spell],
        cost: 3,
        rarity: :common,#CardTemplate::rarities[:common],
        effects: [
          {
            trigger: "on_play",
            action: "deal_damage",
            value: 3
          }
        ]
      },
      {
        name: "Meditation",
        card_type: :passive,#CardTemplate::card_types[:passive],
        cost: 4,
        rarity: :rare,#CardTemplate::rarities[:rare],
        effects: [
          {
            trigger: "on_turn_start",
            action: "gain_mana",
            value: 1
          }
        ]
      }
    ]

    CardTemplate.create(card_templates)
  end
end
