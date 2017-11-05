class Listing < ApplicationRecord
  include ImageUploader[:product_image]
  belongs_to :store
  attr_accessor :country_name
  
  
  validates :title, presence: true
  validates :variety, presence: true
  validates :country, presence: true
  validates :roast, presence: true
  validates :weight, presence: true
  validates :roast_date, presence: true
  validates :price_cents, presence: true
  validates :shipping_cents, presence: true
  validates :about, presence: true, length: {maximum: 500}
              
  monetize :price_cents
  monetize :shipping_cents
  
  def country_name
    country_n = ISO3166::Country[country]
    country_n.name
  end
  
end
