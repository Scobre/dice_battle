class Seeder
  def self.seed_card_templates
    puts "Creating card templates..."

    card_templates = [
      {
        name: "Arcane Study",
        gold_cost: 3,
        mana_cost: 1,
        card_type: :spell,
        rarity: :common,
        effects: [
          {
            mastery_required: 0,
            action: "gain_mastery",
            value: 1
          },
          {
            mastery_required: 10,
            action: "gain_mastery",
            value: 2
          }
        ]
      },
      {
        name: "Fireball",
        gold_cost: 4,
        mana_cost: 2,
        card_type: :spell,
        rarity: :common,
        effects: [
          {
            mastery_required: 0,
            action: "deal_damage",
            value: 4
          },
          {
            mastery_required: 10,
            action: "deal_damage",
            value: 7
          }
        ]
      },
      {
        name: "Mana Reactor",
        gold_cost: 5,
        mana_cost: 0,
        card_type: :passive,
        rarity: :rare,
        effects: [
          {
            mastery_required: 0,
            action: "passive_mana",
            value: 1
          },
          {
            mastery_required: 15,
            action: "passive_mana",
            value: 2
          }
        ]
      },
      {
        name: "Reinforced Barrier",
        gold_cost: 4,
        mana_cost: 1,
        card_type: :power,
        rarity: :common,
        effects: [
          {
            mastery_required: 0,
            action: "gain_shield",
            value: 5
          },
          {
            mastery_required: 8,
            action: "gain_shield",
            value: 9
          }
        ]
      },
      {
        name: "Blood Ritual",
        gold_cost: 6,
        mana_cost: 0,
        card_type: :power,
        rarity: :epic,
        effects: [
          {
            mastery_required: 0,
            action: "lose_health",
            value: 3
          },
          {
            mastery_required: 0,
            action: "gain_mastery",
            value: 3
          }
        ]
      },
      {
        name: "Temporal Echo",
        gold_cost: 7,
        mana_cost: 3,
        card_type: :power,
        rarity: :legendary,
        effects: [
          {
            mastery_required: 0,
            action: "repeat_last_spell",
            value: 1
          }
        ]
      }
    ]

    CardTemplate.create(card_templates)
  end
end
