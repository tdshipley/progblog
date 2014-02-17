class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true
  validate :title, uniqueness: true, length: { minimum: 10 }
  validate :body, length: { minimum: 20 }
end
