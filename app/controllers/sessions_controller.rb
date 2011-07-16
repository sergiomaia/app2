class SessionsController < ApplicationController
  def new
  end

  def create
    if # authenticated?
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
   end
 end

 def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
 end

 private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session
       [:user_id]
     end
   helper_method :current_user

end

