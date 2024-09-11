class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "予定を新規追加しました"
      redirect_to :posts
    else
      flash.now[:error] = "予定を追加できませんでした"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "予定を編集しました"
      redirect_to :posts
    else
      flash.now[:error] = "予定を編集できませんでした"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :posts
  end

  private
    def post_params
      params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo)
    end

end
