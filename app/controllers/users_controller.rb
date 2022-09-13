class UsersController < ApplicationController
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
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :title, :body)
  end
end
