class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET / items
  def index
    @items = policy_scope(Item)
  end

  # GET /items/:id
  def show
    @exchanges = Exchange.all
  end

  # GET /items/new
  def new
    @item = Item.new
    authorize @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  # GET /items/:id/edit
  def edit
  end

  # PATCH /items/:id
  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:title, :description, :condition, :year_made, :number_available)
  end
end
