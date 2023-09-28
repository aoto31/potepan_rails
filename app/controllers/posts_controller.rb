class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:memo))
      flash[:notice] = "スケジュールIDが「#{@post.id}」の情報を更新しました"
      redirect_to posts_path
    else
      render "edit"
    end
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

  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(:title,:start_date,:end_date,:is_all_day,:memo)
  end
end
