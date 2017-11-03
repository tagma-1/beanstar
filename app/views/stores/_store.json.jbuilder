json.extract! store, :id, :user_id, :name, :image_data, :address, :suburb, :state, :postcode, :about, :roasting_schedule, :next_roast, :pickup, :created_at, :updated_at
json.url store_url(store, format: :json)
