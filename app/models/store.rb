class Store < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_many :listings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  

  validates :name, presence: true
  validates :about, presence: true, length: {maximum: 400}
  validates :roasting_schedule, presence: true
  validates :state, presence: true
  validates :postcode, presence: true, numericality: { less_than_or_equal_to: 9999 }
  
  with_options if: :pickup? do |location|
    location.validates :address, presence: true
    location.validates :suburb, presence: true
  end  
  
  
end
