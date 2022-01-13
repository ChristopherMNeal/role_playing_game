class InventoriesController < ApplicationController

def new
  @user = current_user
  @character = Character.find(params[:character_id])
  @inventory = @character.inventories.new
  render :new
end

def create
  @user = current_user
  @character = Character.find(params[:character_id])
  @inventory = @character.inventories.new(inventory_params)
  if @inventory.save
    flash[:notice] = "You have successfully added an item!"
    redirect_to user_character_path(@user, @character)
  else
    flash[:alert] = "There was an error updating your item!"
    render :new
  end
end

def show
  @user = current_user
  @character = Character.find(params[:character_id])
  @inventory = Inventory.find(params[:id])
  render :show
end

def edit
  @user = current_user
  @character = Character.find(params[:character_id])
  @inventory = Inventory.find(params[:id])
  render :edit
end

def update
  @user = current_user
  @character = Character.find(params[:character_id])
  @inventory = Inventory.find(params[:id])
  if @inventory.update(inventory_params)
    flash[:notice] = "You have successfully updated an item!"
    redirect_to user_character_inventory_path(@user, @character, @inventory)
  else
    @character = Character.find(params[:character_id])
    flash[:alert] = "There was an error updating your item!"
    render :edit
  end
end

def destroy
  @user = current_user
  @character = Character.find(params[:character_id])
  @inventory = Inventory.find(params[:id])
  @inventory.destroy
  redirect_to user_character_path(@user, @character)
end

# Other controller actions go here.

private
  def inventory_params
    params.require(:inventory).permit(:item, :quantity)
  end
end