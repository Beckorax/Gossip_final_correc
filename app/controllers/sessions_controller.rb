class SessionsController < ApplicationController

  def new
  end

  def create
    # # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      flash[:success] = 'Connexion réussi'
      redirect_to user

    else
      flash[:danger] = 'Mot de passe invalid/Mauvaise combinaison de mot de passe'
      render :new
    end    
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Déconnexion réussi'
    redirect_to :root
  end

end
