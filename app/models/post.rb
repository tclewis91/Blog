class Post < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 1}
  validates :body, presence: true
end

# validates means that anytime a user enters new blog post it
# has to have the following criteria
