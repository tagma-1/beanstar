json.extract! review, :id, :user_id, :store_id, :rating, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
