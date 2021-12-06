class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @items = Item.all
    @exchanges = Exchange.all.map(&:item_id)
    @items_filtered = @items.reject do |item|
      @exchanges.include?(item.id)
    end
  end
end
