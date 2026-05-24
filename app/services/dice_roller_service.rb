class DiceRollerService
  def self.call(player)
    new(player).call
  end

  def initialize(player)
    @player = player
  end

  def call
    return false if player.has_rolled?

    results = []

    player.dices.each do |dice|
      rolled_face = roll_dice(dice)

      results << {
        dice_id: dice.id,
        position: dice.position,
        face: rolled_face.face_template.name,
        face_type: rolled_face.face_template.face_type,
        value: rolled_face.face_template.value
      }

      dice.update(last_rolled_face_id: rolled_face.id)

      apply_face_effect(rolled_face.face_template)
    end

    player.update(has_rolled: true, last_roll_results: results)

    results
  end

  private

  attr_reader :player

  def roll_dice(dice)
    dice.dice_faces.sample
  end

  def apply_face_effect(face_template)
    case face_template.face_type.to_sym
    when :gold
      player.increment!(:gold, face_template.value)

    when :mana
      player.increment!(:mana, face_template.value)

    when :shield
      player.increment!(:shield, face_template.value)

    when :attack
      # plus tard :
      # target.take_damage(...)
    end
  end
end
