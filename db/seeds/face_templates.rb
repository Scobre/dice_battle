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
        cost: 2,
        tags: [],
        effects: []
      },
      {
        name: "Gold II",
        icon: "💰",
        face_type: :gold,
        value: 2,
        rarity: :rare,
        cost: 5,
        tags: [],
        effects: []
      },
      {
        name: "Attack I",
        icon: "⚔️",
        face_type: :attack,
        value: 1,
        rarity: :common,
        cost: 2,
        tags: [],
        effects: []
      },
      {
        name: "Attack II",
        icon: "⚔️",
        face_type: :attack,
        value: 2,
        rarity: :rare,
        cost: 5,
        tags: [],
        effects: []
      },
      {
        name: "Mana I",
        icon: "🔮",
        face_type: :mana,
        value: 1,
        rarity: :common,
        cost: 3,
        tags: [],
        effects: []
      },
      {
        name: "Shield I",
        icon: "🛡️",
        face_type: :shield,
        value: 1,
        rarity: :common,
        cost: 2,
        tags: [],
        effects: []
      },
      {
        name: "Blank",
        icon: "⬜",
        face_type: :utility,
        value: 0,
        rarity: :common,
        cost: 0,
        tags: ["blank"],
        effects: []
      }
    ]

    FaceTemplate.create(face_templates)
  end
end
