class UsersController < ApplicationController
  def show
    @users = User.all
    @index = params[:id]
    @user = @users.find(@index)
    
  end
  
  def new
    @user = User.new
    @cities = City.all.collect {|x| [x.name, x.id]}
  end

  def create
    @users = User.all
    @cities = City.all.collect {|x| [x.name, x.id]}
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Vous êtes inscrits !"
      session[:user_id] = @user.id
      remember user
      redirect_to gossips_path
    else
      flash[:error] = "L'utilisateur n'a pas été créé"
      render new_user_path
    end
  end

  def index
    @users = User.all
    @user = User.new
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :age, :description)
  end

end
