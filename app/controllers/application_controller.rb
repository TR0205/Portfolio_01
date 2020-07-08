# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_all_ranks

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def set_all_ranks
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def authenticate_user
    if @current_user.nil?
      flash[:notice] = 'ログインが必要です'
      redirect_to('/login')
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice]
      redirect_to('/posts/index')
    end
  end
end
