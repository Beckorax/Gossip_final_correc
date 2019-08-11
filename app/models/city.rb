class City < ApplicationRecord
  has_many :users
  validates :zip_code,
  presence: true,
  length: {  is: 5 }
  validates :name,
  presence: true
end
