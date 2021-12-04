class ExchangesController < ApplicationController
  before_action :set_item, only: [:create]

  def index
    # @exchanges = policy_scope(Exchange).order(created_at: :desc) #not sure how to use this currently
    @exchange = policy_scope(Exchange)
    @items = policy_scope(Item)
    @user_exchanges = @exchange.select do |exchange|
      exchange.user_id == current_user.id
    end
    @user_items = @items.select do |item|
      item.user_id == current_user.id
    end
    authorize @exchange
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

  # def update
  #   @exchange = Exchange.find(params[:id])
  #   if @exchange.update(exchanges_params)
  #     flash[:success] = "Exchange updated"
  #     redirect_to exchanges_path
  #   else
  #     render exchanges_path
  #   end
  #   authorize @exchange
  # end

  def approve
    @exchange = Exchange.find(params[:id])
    @exchange.approved = true
    @exchange.save
    authorize @exchange
    redirect_to exchanges_path, flash: { success: "Message" }
  end

  private

  def exchanges_params
    params.require(:exchange).permit(:location, :method, :time_slot, :approved)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
