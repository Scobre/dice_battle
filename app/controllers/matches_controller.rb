class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find_by(id: params[:id])
  end

  def create
    match = MatchCreationService.call(
      player_count: params[:player_count].to_i
    )

    redirect_to match_path(match)
  end

  def activate_card
    @match = Match.find_by(id: params[:id])

    player_card =
      PlayerCard.find_by(id: params[:player_card_id])

    Cards::CardActivationService.call(player_card)

    respond_to do |format|

      format.turbo_stream

      format.html do
        redirect_to @match
      end
    end
  end

  def buy
    @match = Match.find_by(id: params[:id])

    success = ShopPurchaseService.call(
      player: @match.active_player,
      shop_slot: @match.shop_slots.find(params[:shop_slot_id]),
      dice_face_id: params[:dice_face_id]
    )

    respond_to do |format|

      format.turbo_stream

      format.html do
        redirect_to @match
      end
    end
  end

  def end_turn
    @match = Match.find_by(id: params[:id])

    TurnManagerService.next_turn(@match)

    respond_to do |format|

      format.turbo_stream

      format.html do
        redirect_to match_path(@match)
      end
    end
  end

  def play_card
    match = Match.find_by(id: params[:id])

    player_card = match
      .active_player
      .player_cards
      .find_by(id: params[:player_card_id])

    PlayCardService.call(player_card)

    redirect_to match_path(match)
  end

  def roll_dice
    @match = Match.find_by(id: params[:id])

    player = @match.players.find_by(id: params[:player_id])

    DiceRollerService.call(player)

    respond_to do |format|

      format.turbo_stream

      format.html do
        redirect_to match_path(@match)
      end
    end
  end
end
