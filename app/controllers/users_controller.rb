class UsersController < ApplicationController
  before_action :set_user , only: [:edit, :update, :show, :followings, :followers, :like_microposts]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all
    render :user
  end
  
  def show
    @title = "Micropost"
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'Profileを更新しました。'
      redirect_to @user 
    else
      render 'edit'
    end
  end
  
  def followings
    @title = "follow"
    @users = @user.following_users
    render 'show_follow'
  end
  
  def followers
    @title = "follower"
    @users = @user.follower_users
    render 'show_follow'
  end
  
  def like_microposts
    @microposts = @user.like_microposts
    @title = "Like Micropost"
    render :show
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :birthplace, :self_introducation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def correct_user
      unless current_user?(@user) 
        redirect_to root_url
        flash[:danger] = "自分以外のProfileは変更できません"
      end
    end
end
