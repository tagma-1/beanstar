class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  
  # User rating of between 1 and 100 percent
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  
end
