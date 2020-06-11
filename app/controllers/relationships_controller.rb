class RelationshipsController < ApplicationController

  def create
    follow = @current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    flash[:notice] = "ユーザーをフォローしました"
    redirect_to("/users/index")
  end

  def destroy
    follow = @current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to ("/users/index")
  end
end