class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  def posts_attributes=(posts_attributes)
    posts_attributes.values.each do |post_attribute|
      post = Post.find_or_create_by(post_attribute)
      self.posts << post
    end
  end
end
