class GossipsController < ApplicationController
  before_action :logged_in_user, except: [:show, :index]  
  def new
    @gossip = Gossip.new
    @tags = Tag.tag_array
  end

  def create
    puts params
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
      flash[:success] = "Potin créé"
      redirect_to gossips_path
    else
      render :new
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
    @tags = Tag.tag_array
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = "Potin supprimé"
    redirect_to index
  end

  def update
    @gossips = Gossip.all
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = "Potin modifié"
      redirect_to @gossip
    else
      flash[:error] = "Le potin n'a pas été modifié"
      render :edit
    end
  end

  def show
    @index = params[:id]
    @gossips = Gossip.all
    @gossip = @gossips.find(@index)
    @comments = Comment.all
    @likes = @gossip.likes.count 
    @tags_string = @gossip.tags.pluck(:title).join(", ")
  end

  def index
    @gossips = Gossip.all
    @gossip = Gossip.new
    @likes = @gossip.likes.count 
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :tag_ids => []).merge(user: current_user)
  end
  

end