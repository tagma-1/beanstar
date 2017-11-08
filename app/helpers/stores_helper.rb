module StoresHelper

  def store_rating(store)
    store.reviews.count > 0 ? "#{store.reviews.average(:rating).floor}%" : "N/A"
  end

  def followers(store)
    store.followers.count
  end
  
end
