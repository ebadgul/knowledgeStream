class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_histories


  before_save :update_history
  def update_history
    unless self.new_record?
      post = Post.find(self.id)
      post_history = PostHistory.new
    post_history.post_id = self.id
    post_history.title = post.title
    post_history.description = post.description
    post_history.save
    end
  end
end
