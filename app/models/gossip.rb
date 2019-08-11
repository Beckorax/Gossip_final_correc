class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_gossips_tags
  has_many :tags, through: :join_table_gossips_tags
  accepts_nested_attributes_for :tags
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  validates :title,
  presence: true,
  length: { in: 3..14 }
  validates :content,
  presence: true
end