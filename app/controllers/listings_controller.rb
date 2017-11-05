class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /listings
  # GET /listings.json
  def index
    if params[:id]
      @listings = Listing.where(store_id: params[:id]).paginate(page: params[:page], per_page: 6)
    else
      @listings = Listing.all.paginate(page: params[:page], per_page: 6)
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @total_price = @listing.price + @listing.shipping
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    authorize @listing
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.store = current_user.store
    
    #Accepts user input as a string, removes non-digit characters and saves to database as an integer representing the total in cents
    @listing.price_cents = listing_params[:price_cents].gsub(/[\D]/, '').to_i
    @listing.shipping_cents = listing_params[:shipping_cents].gsub(/[\D]/, '').to_i

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    authorize @listing
    
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    
    authorize @listing
    
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :variety, :country, :region, :producer, :notes, :roast, :grind, :weight, :roast_date, :about, :product_image, :price_cents, :shipping_cents)
    end
    
end
