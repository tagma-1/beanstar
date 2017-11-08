class Store < ApplicationRecord
  
  include PgSearch
  multisearchable :against => [:name, :address, :suburb, :state, :postcode, :about] 
  
  include ImageUploader[:image]
  
  belongs_to :user
  has_and_belongs_to_many :followers, class_name: "User", join_table: :following
  has_many :listings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  

  validates :name, presence: true
  validates :about, presence: true, length: {maximum: 400}
  validates :roasting_schedule, presence: true
  validates :state, presence: true
  validates :postcode, presence: true, numericality: { less_than_or_equal_to: 9999 }
  
  #Only validates the address and suburb if the user has elected to make pickup available
  with_options if: :pickup? do |location|
    location.validates :address, presence: true
    location.validates :suburb, presence: true
  end  
  
  # Scope for average store ratings (used for sort)
  scope :rating_order, -> {
    joins(:reviews).select("stores.*, avg(reviews.rating) as average_rating").group("stores.id").order("average_rating DESC")
  }
  
  # Ordering method for sort function
  def self.order_list(sort_order)
    case sort_order
      when "name" || sort_order.blank?
        order(name: :asc)
      when "store rating"
        rating_order 
      else
        order(name: :asc)
    end
  end
  
end
