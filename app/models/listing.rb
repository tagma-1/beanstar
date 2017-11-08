class Listing < ApplicationRecord
  
  include PgSearch
  multisearchable :against => [:title, :variety, :country, :region, :producer, :notes, :roast] 

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
  
  # Ordering method for sort function
  def self.order_list(sort_order)
    case sort_order
      when "newest" || sort_order.blank?
        order(created_at: :desc)
      when "name"
        order(title: :asc)
      else
        order(created_at: :desc)
    end
  end
  
end
