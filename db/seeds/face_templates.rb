class Seeder
  def self.seed_face_templates
    puts "Creating face templates..."

    face_templates = [
      {
        name: "Gold I",
        icon: "💰",
        face_type: :gold,
        value: 1,
        rarity: :common,
        gold_cost: 2,
        tags: [],
        effects: []
      },
      {
        name: "Gold II",
        icon: "💰",
        face_type: :gold,
        value: 2,
        rarity: :rare,
        gold_cost: 5,
        tags: [],
        effects: []
      },
      {
        name: "Attack I",
        icon: "⚔️",
        face_type: :attack,
        value: 1,
        rarity: :common,
        gold_cost: 2,
        tags: [],
        effects: []
      },
      {
        name: "Attack II",
        icon: "⚔️",
        face_type: :attack,
        value: 2,
        rarity: :rare,
        gold_cost: 5,
        tags: [],
        effects: []
      },
      {
        name: "Mana I",
        icon: "🔮",
        face_type: :mana,
        value: 1,
        rarity: :common,
        gold_cost: 3,
        tags: [],
        effects: []
      },
      {
        name: "Mana II",
        icon: "🔮",
        face_type: :mana,
        value: 2,
        rarity: :common,
        gold_cost: 6,
        tags: [],
        effects: []
      },
      {
        name: "Shield I",
        icon: "🛡️",
        face_type: :shield,
        value: 1,
        rarity: :common,
        gold_cost: 2,
        tags: [],
        effects: []
      },
      {
        name: "Shield II",
        icon: "🛡️",
        face_type: :shield,
        value: 2,
        rarity: :common,
        gold_cost: 5,
        tags: [],
        effects: []
      },
      {
        name: "Blank",
        icon: "⬜",
        face_type: :utility,
        value: 0,
        rarity: :common,
        gold_cost: 0,
        tags: ["blank"],
        effects: []
      }
    ]

    FaceTemplate.create(face_templates)
  end
end
