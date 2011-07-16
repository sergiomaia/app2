class SessionsController < ApplicationController
  def new
  end

  def create
    if # authenticated?
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logado!"
    else
      flash.now.alert = "Senha ou email inválidos"
      render "new"
   end
 end

 def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Saiu da aplicação!"
 end

 private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session
       [:user_id]
     end
   helper_method :current_user

end

