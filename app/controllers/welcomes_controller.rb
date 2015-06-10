class WelcomesController < ApplicationController
  def index
    respond_to do |f|
      f.html do
        render 'index.html.erb', locals: {post: Post.all}
      end
    end
  end

  def about
  end
end



