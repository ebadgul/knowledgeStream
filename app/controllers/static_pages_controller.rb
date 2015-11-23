class StaticPagesController < ApplicationController
  def home
    # @user = User.find(params[:user_id])
    @posts = Post.all
    # @posts = @user.posts
  end
  

  def help
  end

  def about

  end

  def contact
  end

end