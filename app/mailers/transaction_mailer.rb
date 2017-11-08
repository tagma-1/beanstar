class TransactionMailer < ApplicationMailer
  
  require 'mailgun'
  
  def buyer_transaction_email_shipping(purchase)
    begin
      @buyer = purchase.user
      @product = purchase.listing
      @purchase = purchase
   
      mg_client = Mailgun::Client.new ENV.fetch('MAILGUN_API_KEY')
      message_params = {:from    => "beanstar@example.com",
                        :to      => @buyer.email,
                        :subject => 'Purchase Receipt - Beanstar',
                        :text    => "Thank you for shopping at Beanstar! This email confirms your purchase of #{@product.title} - #{@product.weight} grams from #{@product.store.name} for $#{@product.price} plus $#{@product.shipping}. Your order will be shipped to #{@purchase.address}." }
      mg_client.send_message ENV.fetch('MAILGUN_DOMAIN'), message_params
    
    #Rescues if profile not on authorised recipients list (testing)
    rescue Mailgun::CommunicationError
      nil
    end
    
  end
  
  def buyer_transaction_email_pickup(purchase)
    begin
      @buyer = purchase.user
      @product = purchase.listing
      @purchase = purchase
   
      mg_client = Mailgun::Client.new ENV.fetch('MAILGUN_API_KEY')
      message_params = {:from    => "beanstar@example.com",
                        :to      => @buyer.email,
                        :subject => 'Purchase Receipt - Beanstar',
                        :text    => "Thank you for shopping at Beanstar! This email confirms your purchase of #{@product.title} - #{@product.weight} grams from #{@product.store.name} for $#{@product.price}. Your order is now available for collection from #{@product.store.name} at #{[@product.store.address, @product.store.suburb, @product.store.postcode, @product.store.state].join(', ')}."}
                        
      mg_client.send_message ENV.fetch('MAILGUN_DOMAIN'), message_params
    
    #Rescues if profile not on authorised recipients list (testing)
    rescue Mailgun::CommunicationError
      nil
    end
    
  end
  
  def seller_transaction_email_shipping(purchase)
    begin
      @seller = purchase.listing.store.user
      @product = purchase.listing
      @purchase = purchase
   
      mg_client = Mailgun::Client.new ENV.fetch('MAILGUN_API_KEY')
      message_params = {:from    => "beanstar@example.com",
                        :to      => @seller.email,
                        :subject => 'Purchase Notification - Beanstar',
                        :text    => "This email confirms the purchase of #{@product.title} - #{@product.weight} grams by #{@purchase.user.profile.profile_name} (#{@purchase.user.email}) for $#{@product.price} plus $#{@product.shipping}. Please ship this order to #{@purchase.address}." }
      mg_client.send_message ENV.fetch('MAILGUN_DOMAIN'), message_params
    
    #Rescues if profile not on authorised recipients list (testing)
    rescue Mailgun::CommunicationError
      nil
    end    
    
  end
  
  def seller_transaction_email_pickup(purchase)
    begin
      @seller = purchase.listing.store.user
      @product = purchase.listing
      @purchase = purchase
   
      mg_client = Mailgun::Client.new ENV.fetch('MAILGUN_API_KEY')
      message_params = {:from    => "beanstar@example.com",
                        :to      => @seller.email,
                        :subject => 'Purchase Notification - Beanstar',
                        :text    => "This email confirms the purchase of #{@product.title} - #{@product.weight} grams by #{@purchase.user.profile.profile_name} (#{@purchase.user.email}) for $#{@product.price}. The purchaser has indicated that they will pick-up this order, so no shipping is required."}
                        
      mg_client.send_message ENV.fetch('MAILGUN_DOMAIN'), message_params
    
    #Rescues if profile not on authorised recipients list (testing)
    rescue Mailgun::CommunicationError
      nil
    end    
        
  end
  
    
  
end
