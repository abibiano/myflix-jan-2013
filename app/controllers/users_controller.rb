class UsersController < ApplicationController
  before_filter :require_user, only: [:show, :people]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: 'User was succesfully created'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def people
    @user = current_user
  end

end