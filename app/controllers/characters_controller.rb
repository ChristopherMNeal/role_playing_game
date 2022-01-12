class CharactersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @characters = Character.all
    render :index
  end

  def new
    @user = User.find(params[:user_id])
    @character = @user.characters.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @character = @user.characters.new(character_params)
    if @character.save
      redirect_to characters_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @character = Character.find(params[:id])
    render :edit
  end

  def show
    @user = User.find(params[:user_id])
    @character = Character.find(params[:id])
    render :show
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to characters_path
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  private
    def character_params
      params.require(:character).permit(:name, :role, :health)
    end
end