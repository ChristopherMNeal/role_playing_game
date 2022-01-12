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
    @character.avatar_photo.attach(params[:character][:avatar_photo])
    if @character.save
      flash[:notice] = "You have successfully created a character!"
      redirect_to user_characters_path(@user)
    else
      flash[:alert] = "There was an error in creating your character!"
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
      flash[:notice] = "You have successfully updated a character!"
      redirect_to user_characters_path(@user)
    else
      flash[:alert] = "There was an error in updated your character!"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to user_characters_path(@user)
  end

  private
    def character_params
      params.require(:character).permit(:name, :role, :health)
    end
end