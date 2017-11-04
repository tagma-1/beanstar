json.extract! listing, :id, :store_id, :title, :variety, :countryregion, :producer, :notes, :roast, :grind, :weight, :roast_date, :about, :price, :shipping, :product_image_data, :created_at, :updated_at
json.url listing_url(listing, format: :json)
