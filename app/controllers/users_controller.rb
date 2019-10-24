class UsersController < ApplicationController

  def new
  # byebug
    @user = User.new
	end

  def index
    @user = User.all
  end
  
  def create
  @user = User.new(user_params)
  if @user.save
    UserMailer.welcome_email(@user).deliver
    redirect_to login_path(@user)
    flash[:notice] = "#{@user.name} registered successfully "
  else
    flash[:notice] ='ERROR: Account was not created'
    render 'new'
  end
  end

  def show
    @user = User.all
  end

  def destroy
    User.find(params[:id]).delete
  end

  private 
  def user_params
  	params.require(:user).permit(:name, :email, :phone, :password)
  end
end
