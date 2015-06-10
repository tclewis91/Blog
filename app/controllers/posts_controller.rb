class PostsController < ApplicationController

  def index
    all_posts = Post.all
    respond_to do |format|
      format.html do
        render 'index.html.erb', locals: {posts: all_posts}
      end
    end
  end


  def new
    render 'new.html.erb', locals: { post: Post.new}
  end

  def create
    begin
      post = Post.create(post_params)
      respond_to do |f|
        f.html do
          redirect_to "/posts/#{post.id}"
        end
      end
    end
  end

  def show
    search_blog = Post.find(params[:id])
    respond to do |format|
      format.html do
        render 'show.html.erb', locals: {posts_serach: search_posts}
      end
    end
  end

  def destroy
    if Post.exists?(params[:id])
      Post.destroy(params[:id])
      redirect_to "/posts"
    end
  end

  def post_blog
    params.require(:post).permit(:title, :body)
  end
end


