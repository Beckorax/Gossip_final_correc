class CommentsController < ApplicationController
  before_action :logged_in_user
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.create(comment_params)
    flash[:success] = "Commentaire créé"
    redirect_to gossip_path(@gossip)
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip_id = params[:gossip_id]
    @comment_id = params[:id]
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Commentaire supprimé"
    redirect_to gossip_url(params[:gossip_id])
  end

  def update
    @comments = Comment.all
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Commentaire modifié"
      redirect_to gossip_url(params[:gossip_id])
    end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:content).merge(user: current_user)
    end
end
