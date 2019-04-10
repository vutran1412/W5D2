class CommentsController < ApplicationController
  before_action :require_logged_in

  def new
    @post = Post.find_by(post_id: params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user.id
    # debugger
    @comment.post_id = params[:post_id]
    if @comment.save!
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = ["Invalid comment"]
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
