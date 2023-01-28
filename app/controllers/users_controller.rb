class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    	@book = Book.new
        @user =User.find(params[:id])
        @books = @user.books

  end

  def index
   @users =User.all
    	@books = Book.all
    	@book = Book.new
        @user = current_user
  end

  def edit
    @user =User.find(params[:id])
    if @user!=current_user
        redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
   flash[:notice] = 'update successfully.'

   if @user.update(user_params)
     redirect_to user_path(@user.id)
   else
     render :edit
   end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
