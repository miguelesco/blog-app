class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.tree_more_recent_posts
  end

  def generate_jwt
    JWT.encode({ id: id,
                exp: 60.days.from_now.to_i },
              Rails.application.secrets.secret_key_base)
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :photo)
  end
end
