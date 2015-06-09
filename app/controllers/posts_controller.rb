class PostsController < ApplicationController

  def index
    all_posts = Post.all
    respond_to do |format|
      format.html do
        render 'index.html.erb', locals {posts: all_posts}
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
    render 'destroy.html.erb' #check to change
