class PostsController < ApplicationController
  before_action :require_logged_in
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.id
    
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    if @post
      render :show
    else
      flash[:errors] = ["Invalid Post"]
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
