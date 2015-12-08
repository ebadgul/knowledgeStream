class StaticPagesController < ApplicationController
  def home
    @search = Post.search do
      fulltext params[:search]
    end
    @post = @search.results
    
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
