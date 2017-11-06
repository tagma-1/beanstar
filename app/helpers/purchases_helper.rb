module PurchasesHelper
  
  def seller_address
   [@purchase.listing.store.address, @purchase.listing.store.suburb, @purchase.listing.store.postcode, @purchase.listing.store.state].join(', ')
  end
  
end
