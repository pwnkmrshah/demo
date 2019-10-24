class SessionsController < ApplicationController

  def new
  end

  def create
  user = User.where(:email => params[:email].downcase, :password =>  params[:password]).first
  if user 
    session[:user_id] = user.id
    redirect_to manage_book_path, :notice => "Logged in!"
  else
    flash.now[:alert] = "Email or password is invalid"
    render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out!"
  end 

end