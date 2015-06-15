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

  def update
    begin
    post = Post.update(params[:id], post_params)
    respond_to do |f|
      f.html do
        redirect_to "/posts/#{post.id}"
      end
    end
  end

  def destroy
    if Post.exists?(params[:id])
      Post.destroy(params[:id])
      redirect_to "/posts"
    end
  end
end

  private

    def post_blog
      params.require(:post).permit(:title, :body)
    end
  end
end



