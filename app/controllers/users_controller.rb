class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :updete,]
  before_action :authenticate_user!, only: [:index, :show, :edit]
  def show
    @user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
  end

  def index
  	@user = current_user
  	@book = Book.new
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to new_user_session_path
    end
  end
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
