class Post < ActiveRecord::Base
  
  validates :title, :description, :presence => true
  validates :title, :length => {:minimum => 5}
  validates :description, :length => {:minimum => 10}
  validates :title, :uniqueness => true
  

  searchable do
    text :title, :description
  end
    
      
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_histories, dependent: :destroy


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
