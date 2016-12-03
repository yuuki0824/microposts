class UsersController < ApplicationController
  before_action :set_user , only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
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
      redirect_to @user, notice: 'Profileを更新しました。'
    else
      render 'edit'
    end
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :birthplace, :self_introducation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user) 
        redirect_to root_url
        flash[:danger] = "自分以外のProfileは変更できません"
      end
    end
end
