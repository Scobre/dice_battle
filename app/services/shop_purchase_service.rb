class ShopPurchaseService
  def self.call(player:, shop_slot:, dice_face_id:)
    new(player, shop_slot, dice_face_id).call
  end

  def initialize(player, shop_slot, dice_face_id)
    @player = player
    @shop_slot = shop_slot
    @dice_face_id = dice_face_id
  end

  def call
    return false unless affordable?

    spend_gold

    grant_reward

    shop_slot.destroy!

    ShopRefillService.call(player.match)

    true
  end

  private

  attr_reader :player, :shop_slot, :dice_face_id

  def cost
    item.gold_cost
  end

  def item
    shop_slot.face_template || shop_slot.card_template
  end

  def affordable?
    player.gold >= cost
  end

  def spend_gold
    player.decrement!(:gold, cost)
  end

  def grant_reward
    if shop_slot.face?
      ReplaceFaceService.call(
        player: player,
        dice_face_id: dice_face_id,
        face_template: shop_slot.face_template
      )
    elsif shop_slot.card?
      player.player_cards.create(
        card_template: shop_slot.card_template,
        zone: :discard,
        position: player.player_cards.discard.count
      )
    end
  end
end
