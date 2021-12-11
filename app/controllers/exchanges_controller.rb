class ExchangesController < ApplicationController
  before_action :set_item, only: [:create]

  def index
    @exchange = policy_scope(Exchange.where.not(completed: true))
    @items = policy_scope(Item)
    @user_exchanges = @exchange.select do |exchange|
      exchange.user_id == current_user.id
    end
    @user_items = return_filtered_items(@items)
    @markers = return_markers
    authorize @exchange
  end

  def create
    @exchange = Exchange.new(exchanges_params)
    @exchange.item = @item
    @exchange.user = current_user
    @exchange.requested = true
    authorize @exchange

    if @exchange.save
      redirect_to item_path(@item)
    end
  end

  def approve
    @exchange = Exchange.find(params[:id])
    @exchange.approved = true
    @exchange.save
    authorize @exchange
    redirect_to exchanges_path, flash: { success: "Message" }
  end

  def complete
    @exchange = Exchange.find(params[:id])
    @exchange.completed = true
    @exchange.save
    authorize @exchange
    redirect_to exchanges_path, flash: { success: "Message" }
  end

  def destroy
    @exchange = Exchange.find(params[:id])
    @exchange.destroy
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

  def return_markers
    Exchange.joins(:item).where("(items.user_id = #{current_user.id}
      OR exchanges.user_id = #{current_user.id}) AND exchanges.requested = true
      AND exchanges.completed = false").geocoded.map do |exchange|
      {
        lat: exchange.latitude,
        lng: exchange.longitude,
        info_window: render_to_string(partial: "info_window", locals: { exchange: exchange })
      }
    end
  end

  def return_filtered_items(items)
    @exchange_completed = policy_scope(Exchange.where(completed: true))
    @exchange_completed_id = @exchange_completed.map do |exchange|
      exchange.item_id
    end
    @user_items = items.select do |item|
      item.user_id == current_user.id
    end
    @user_items = @user_items.reject do |item|
      @exchange_completed_id.include?(item.id)
    end
  end
end
