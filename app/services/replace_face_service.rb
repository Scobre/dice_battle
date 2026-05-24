class ReplaceFaceService
  def self.call(player:, dice_face_id:, face_template:)
    new(player, dice_face_id, face_template).call
  end

  def initialize(player, dice_face_id, face_template)
    @player = player
    @dice_face_id = dice_face_id
    @face_template = face_template
  end

  def call
    blank_face = find_blank_face

    return unless blank_face

    blank_face.update(
      face_template: face_template
    )
  end

  def call
    dice_face = player
      .dices
      .flat_map(&:dice_faces)
      .find { |face| face.id == dice_face_id.to_i }

    return false unless dice_face

    dice_face.update(
      face_template: face_template
    )
  end

  private

  attr_reader :player, :dice_face_id, :face_template

  def find_blank_face
    player
      .dices
      .flat_map(&:dice_faces)
      .find do |dice_face|
        dice_face.face_template.name == "Blank"
      end
  end
end
