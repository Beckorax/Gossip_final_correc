class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, optional: true
  validates :user_id,
  presence: true, 
  uniqueness: {scope: [:likeable_id, :likeable_type]}
  # validates :likeable_id,
  # presence: true
end
