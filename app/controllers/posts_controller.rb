class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @post = Post.find(params[:id])
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "予定が作成されました"
      redirect_to posts_path
    else 
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:start_date,:end_date,:checkbox,:memo)
  end
end
