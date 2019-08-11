module LikesHelper
  def liked?(gossip_id)
    if !current_user.nil?
    !current_user.likes.where(likeable_type: "Gossip", likeable_id: gossip_id).blank?
    end
  end
end
