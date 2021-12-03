class ExchangesController < ApplicationController
  before_action :set_item, only: [:create, :update]

  def index
    @exchanges = policy_scope(Exchange).order(created_at: :desc)
  end

  def create
    @exchange = Exchange.new(exchanges_params)
    @exchange.item = @item
    @exchange.user = current_user
    authorize @exchange

    if @exchange.save
      redirect_to item_path(@item)
    end
  end

  def update
    if params[:exchange]
      @exchange.update(exchanges_params)
    end
      redirect_to item_path(@item)
  end

  private

  def exchanges_params
    params.require(:exchange).permit(:location, :method, :time_slot)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
