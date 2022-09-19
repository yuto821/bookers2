class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]
    
  def new
    @user=User.new
  end

  def index
    @user=current_user
    @users=User.all
    @book=Book.new
  end

  def show
    @user=User.find(params[:id])
    @books = @user.books
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
  if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
  else
    render :edit
  end
  end

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
