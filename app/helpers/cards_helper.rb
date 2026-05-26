module CardsHelper
  def render_effect(effect)
    case effect["action"]

    when "deal_damage"
      "⚔️ Deal #{effect['value']} damage"

    when "gain_mastery"
      "⭐ Gain #{effect['value']} mastery"

    when "gain_shield"
      "🛡️ Gain #{effect['value']} shield"

    when "passive_mana"
      "🔮 +#{effect['value']} mana each turn"

    else
      effect["action"]
    end
  end
end
