class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def createbooks
    @book = Book.new(book_params)
    if @book.save
    redirect_to books_path(@book.id), notice: 'You have created book successfully.'
    else
    redirect_to books_path(@book.id)
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    #@profile_image = @user.profile_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:title, :body, :name, :profile_image, :introduction)
  end
end