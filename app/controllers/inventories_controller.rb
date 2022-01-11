class InventoriesController < ApplicationController

def new
  @character = Character.find(params[:character_id])
  @inventory = @character.inventories.new
  render :new
end

def create
  @character = Character.find(params[:character_id])
  @inventory = @character.inventories.new(inventory_params)
  if @inventory.save
    redirect_to character_path(@character)
  else
    render :new
  end
end

def show
  @character = Character.find(params[:character_id])
  @inventory = Inventory.find(params[:id])
  render :show
end

def edit
  @character = Character.find(params[:character_id])
  @inventory = Inventory.find(params[:id])
  render :edit
end

def update
  @inventory = Inventory.find(params[:id])
  if @inventory.update(inventory_params)
    redirect_to character_path(@inventory.character)
  else
    @character = Character.find(params[:character_id])
    render :edit
  end
end

def destroy
  @inventory = inventory.find(params[:id])
  @inventory.destroy
  redirect_to character_path(@inventory.character)
end

# Other controller actions go here.

private
  def inventory_params
    params.require(:inventory).permit(:name)
  end
end