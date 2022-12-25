class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  def new
  end

  def index
    @book=Book.new
    @users = User.all
    @user=current_user
  end

  def show
    
    @user =  User.find(params[:id])
    @books = @user.books
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
     flash[:notice] = "You have updated user successfully."
     
    else
      @users=current_user
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
   def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
   end
end
