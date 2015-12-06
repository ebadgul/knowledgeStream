class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_histories

  before_save :update_history

  def update_history
      unless self.new_record?
          comment = Comment.find(self.id)
          comment_history = CommentHistory.new
          comment_history.comment_id= self.id
          comment_history.comment_str = comment.comment
          comment_history.save
      end
  end
  
end
