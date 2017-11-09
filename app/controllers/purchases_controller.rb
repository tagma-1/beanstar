class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:new, :create]

  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  def new
    if current_user.profile
      @purchase.listing = Listing.find(params[:listing_id])
      @amount = @purchase.listing.price_cents + @purchase.listing.shipping_cents
    else
      flash[:danger] = "Please create a profile in order to buy products."
      redirect_to new_profile_path
    end
  end
  
  def create
    
    @purchase.listing = Listing.find(purchase_params[:listing_id])
    
    # Sets a boolean/address depending on whether the item will be picked up or needs shipping
    @purchase.pickup = purchase_params[:pickup]
    @purchase.address = [purchase_params[:address], purchase_params[:suburb], purchase_params[:state], purchase_params[:postcode]].join(', ')
    
    @purchase.user = current_user
    
    # Amount in cents
    @amount = @purchase.listing.price_cents + @purchase.listing.shipping_cents 
  
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "#{[@purchase.listing.title, @purchase.listing.weight].join(', ')} grams",
      :currency    => 'aud'
    )
    
    @purchase.charge_identifier = charge.id
    @purchase.save
    
    #Automatic mailer to purchaser and seller, according to whether shipping has been selected
    if @purchase.pickup
      TransactionMailer.buyer_transaction_email_pickup(@purchase).deliver
      TransactionMailer.seller_transaction_email_pickup(@purchase).deliver
    else
      TransactionMailer.buyer_transaction_email_shipping(@purchase).deliver
      TransactionMailer.seller_transaction_email_shipping(@purchase).deliver    
    end
    
    flash[:success] = "Thank you! Your payment has been received. An email has been sent confirming receipt."
    redirect_to purchase_path(@purchase)
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_purchase_path(listing_id: @purchase.listing_id)
  end
  
  private
  

  def set_purchase
    @purchase = Purchase.new
  end

  def purchase_params
    params.require(:purchase).permit(:listing_id, :pickup, :address, :suburb, :state, :postcode)
  end
  
end
