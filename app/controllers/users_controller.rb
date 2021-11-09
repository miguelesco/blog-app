class UsersController < ApplicationController
  def index;
    @users =  User.all
    p @users
  end

  def show; end
end
