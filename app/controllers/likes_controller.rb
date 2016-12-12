class LikesController < ApplicationController
  
  def like
    @micropost = Micropost.find(params[:micropost_id])
    current_user.likes.find_or_create_by(micropost_id: @micropost.id)
    #redirect_to :back
    render 'like'
  end
  
  def unlike
    @micropost = Micropost.find(params[:micropost_id])
    like = current_user.likes.find_by(micropost_id: @micropost.id)
    like.destroy
    #redirect_to :back
    render 'unlike'
  end
end
