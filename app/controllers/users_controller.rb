class UsersController < ApplicationController
  before_action :set_user,       only: [:show,  :edit, :update, :destroy, :following, :followers]
  before_action :signed_in_user, only: [:index, :edit, :update, :following, :followers]
  before_action :correct_user,   only: [:edit,  :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)

      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @microposts = @user.microposts.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User deleted.'
    redirect_to users_path
  end

  def following
    @page_title = 'Following'
    @users = @user.followed_users.page(params[:page])
    render 'show_follow'
  end

  def followers
    @page_title = 'Followers'
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Before filters

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
