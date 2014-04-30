class UsersController < ApplicationController

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
        @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User profile was updated"
      redirect_to user_path(@user)
    else
      render :edit
    end

  end


  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :id)
  end



end
