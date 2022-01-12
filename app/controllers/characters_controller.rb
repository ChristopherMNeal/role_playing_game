class CharactersController < ApplicationController
include Devise::Controllers::Helpers # helper method to include devise controllers
before_action :only => [:edit] do
  redirect_to new_user_session_path unless current_user && current_user.admin
end

  def index
    # @user = User.find(params[:user_id])
    if current_user.admin
      @user = current_user
      @characters = Character.all
    else
      @user = current_user
      @characters = @user.characters
    end
    render :index
  end

  def new
    @user = current_user
    @character = @user.characters.new
    render :new
  end

  def create
    @user = current_user
    @character = @user.characters.new(character_params)
    if @character.save
      p "Character successfully added!"
      # redirect_to characters_path
      redirect_to user_characters_path(@user)
    else
      p "There was an error in creating your character!"
      render :new
    end
  end

  def edit
    @user = current_user
    @character = Character.find(params[:id])
    render :edit
  end

  def show
    @user = current_user
    @character = Character.find(params[:id])
    render :show
  end

  def update
    @user = current_user
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to user_characters_path(@user)
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