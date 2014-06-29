class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
      session[:user_id] = @user.id
  		flash[:notice] = "Thank you for registering"
  		redirect_to posts_path
  	else
  		flash[:error] = "There was a problem, please try again"
  		render :new
  	end

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User profile was updated"
      redirect_to user_path(@user)
    else
      render :edit
    end

  end


  def show
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :id, :slug)
  end

  def set_user
    @user = User.find_by_slug(params[:id])
  end




end
