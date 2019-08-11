class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, optional: true
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  belongs_to :user
  validates :content,
  presence: true
end
