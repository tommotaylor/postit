class CommentsController < ApplicationController

before_action :require_user
before_action :set_post

  def create
  	@comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post
    @comment.creator = current_user
  	
    if @comment.save
      flash[:notice] = "Your comment was saved"
      redirect_to post_path(@post)
  	else
      flash[:error] = "You've got to say something in your comment!"
  	  redirect_to :back
  	end
  end

  def vote
    @comment = Comment.find(params[:id])
    vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if vote.valid?
         flash[:notice] = "Your vote was counted"
       else
          flash[:error] = "You can only vote once per comment"
        end
         redirect_to :back
       end
       format.js
       end 
  end


private

  def set_post
    @post = Post.find_by(slug: params[:post_id])
  end
end

