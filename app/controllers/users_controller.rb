class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @user=User.new
    @books = @user.books
    @book=Book.new
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :title, :body)
  end
end
