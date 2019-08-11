class LikesController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    current_user.likes.create(likeable_type: "Gossip", likeable_id: @gossip.id)
    flash[:success] = "Like créé"
    redirect_to request.referrer

  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @like = current_user.likes.where(likeable_type: "Gossip", likeable_id: @gossip.id)
    Like.delete(@like)
    flash[:success] = "Like deleted"
    redirect_to request.referrer

  end

end