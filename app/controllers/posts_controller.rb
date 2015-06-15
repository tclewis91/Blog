class PostsController < ApplicationController

  def index
    all_posts = Post.all.order('created_at DESC')
    respond_to do |f|
      f.html do
        render 'index.html.erb', locals: {posts: all_posts}
      end
    end
  end

#creates new post, saves it , and then redirects you to post page
  def new
    @post = Post.new(post_params)
    @post.save
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
    respond to do |f|
      f.html do
        render 'show.html.erb', locals: {posts_serach: search_posts}
      end
    end
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

  private

    def post_blog
      params.require(:post).permit(:title, :body)
    end
  end
end


