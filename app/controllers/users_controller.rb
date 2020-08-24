# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user, { only: %i[edit update] }
  before_action :forbid_login_user, { only: %i[new create login_form login] }
  before_action :ensure_correct_user, { only: %i[edit update] }
  before_action :check_guest, { only: [:update] }

  def index
    @users = User.all.order(created_at: :desc)
  end

  def login_form; end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: 'default_user.jpg',
      password: params[:password]
    )
    if @user.save
      flash[:notice] = '新規登録が完了しました'
      session[:user_id] = @user.id
      redirect_to('/')
    else
      render('users/new')
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.user_text.nil?
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.user_text = nil
      @user = User.new(
        user_text: params[:user_text]
      )
    else
      @user.user_text = params[:user_text]
    end

    if @user.save
      flash[:notice] = 'ユーザー情報を編集しました'
      redirect_to("/users/#{@user.id}")
    else
      render('users/edit')
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to('/')
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('users/login_form')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to('/login')
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = '権限がありません'
      redirect_to('/posts/index')
    end
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def new_guest
    user = User.find_or_create_by!(
      email: 'guest@example.com',
      name: 'example_user'
    ) do |new_guest|
      new_guest.password = SecureRandom.urlsafe_base64
    end
    session[:user_id] = user.id
    redirect_to('/')
  end

  def check_guest
    user = User.find_by(id: params[:id])
    if user.email == 'guest@example.com'
      redirect_to('/')
      flash[:notice] = 'ゲストユーザーの編集はできません'
    end
  end

  def follows
    @user = User.find_by(id: params[:id])
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    @user = User.find_by(id: params[:id])
    user = User.find(params[:id])
    @users = user.followers
  end

  def search
    @users = User.search(params[:search])
  end
end