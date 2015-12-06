class StaticPagesController < ApplicationController
  def home
    @posts = Post.all
    @post = Post.new
    @post.user = current_user
  end
  

  def help
  end

  def about

  end

  def contact
  end

end
