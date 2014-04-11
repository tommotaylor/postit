class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(params[:id])
  end

  def create
    @post = Post.new(params[:id])
      if @post.save
        flash[:notice] = "Successfully saved"
        redirect_to 'posts'
      else
        flash[:error] = "There was an error"
        render 'new'
      end
  end

  def edit
  end

  def update
  end




private

  




end
