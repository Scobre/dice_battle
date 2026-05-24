class ShopRefillService
  FACE_SLOTS = 3
  CARD_SLOTS = 3

  def self.call(match)
    new(match).call
  end

  def initialize(match)
    @match = match
  end

  def call
    refill_face_slots
    refill_card_slots
  end

  private

  attr_reader :match

  def refill_face_slots
    current = match.shop_slots.face.count

    missing = FACE_SLOTS - current

    missing.times do
      pool_entry = draw_face_pool

      next unless pool_entry

      match.shop_slots.create(
        slot_type: :face,
        face_template: pool_entry.face_template,
        position: next_position(:face)
      )

      decrement_pool(pool_entry)
    end
  end

  def refill_card_slots
    current = match.shop_slots.card.count

    missing = CARD_SLOTS - current

    missing.times do
      pool_entry = draw_card_pool

      next unless pool_entry

      match.shop_slots.create(
        slot_type: :card,
        card_template: pool_entry.card_template,
        position: next_position(:card)
      )

      decrement_pool(pool_entry)
    end
  end

  def draw_face_pool
    available = match.match_face_pools.where("quantity > 0")

    available.sample
  end

  def draw_card_pool
    available = match.match_card_pools.where("quantity > 0")

    available.sample
  end

  def decrement_pool(pool_entry)
    pool_entry.decrement!(:quantity)
  end

  def next_position(type)
    match.shop_slots.where(slot_type: type).count
  end
end
