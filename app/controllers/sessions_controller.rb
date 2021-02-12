class SessionsController < ApplicationController


  add_flash_types :warning, :info, :danger, :success

  def new
    @user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
  
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to root_path, success: "You are log in !"
  
    else
      redirect_to login_path, danger: "incorrect Password / email combination"
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, info: "You are now log out !"
  end




end
