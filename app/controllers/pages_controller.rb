class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @items = Item.search_by_title_and_description(params[:query])
    else
      @items = Item.all
    end

    @exchanges = Exchange.all.map(&:item_id)

    @items_filtered = @items.reject do |item|
      @exchanges.include?(item.id)
    end

    @count = Exchange.joins(:item).where("(items.user_id = #{current_user.id}
    OR exchanges.user_id = #{current_user.id}) AND exchanges.requested = true
    AND exchanges.approved = false").count

  end
end
