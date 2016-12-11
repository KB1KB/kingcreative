class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    if session[:temperature].nil?
      @temperature = get_weather
      session[:temperature] =@temperature
    else
      @temperature = session[:temperature]
    end
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# Add Item Quantity
  def add_quantity

  # Save Params To Item Id
  item_id = params[:item_id]

#Increase Item Quantity
Item.find(item_id).increment!(:quantity)
  redirect_to "/items/"
  end

# Decrease Item Quantity
def decrease_quantity

  # Save Params To Item Id
  item_id = params[:item_id]

#Decrease Item Quantity
Item.find(item_id).decrease_quantity!(:quantity)
  redirect_to "/items/"
end

private
def set_items
  @item = Item,find(params[:id])
end

def item_params
  params.require(:item).permit(name, :price, :quantity)
end
end
