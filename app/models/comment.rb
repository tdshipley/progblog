class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, :body, uniqueness: true, presence: true
  validate :name, length: { minimum: 3 }
  validate :body, length: { minimum: 10 }
end
