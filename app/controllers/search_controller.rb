class SearchController < ApplicationController
  
  def search
    str_search = params[:search]
    @posts = Post.search(str_search)
  end
end
