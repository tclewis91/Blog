class PostsController < ApplicationController

  def index
   @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    begin
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update #spacing looks jacked..fix later)
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
     'edit'
  end
end

  def destroy
    if Post.exists?(params[:id])
      Post.destroy(params[:id])
      redirect_to "/posts"
    end
  end

  private

    def post_blog
      params.require(:post).permit(:title, :body)
    end
  end
end



