class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all.order_list(params[:sort_by]).paginate(page: params[:page], per_page: 6)
    
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    
    # Full address
    @address = [@store.address, @store.suburb, @store.postcode, @store.state].join(', ')
    
    # Display the general area where a store is located using postcode API
    response = HTTParty.get("http://v0.postcodeapi.com.au/suburbs/#{@store.postcode}.json")
    @area = []
    response.each { |suburb| @area << suburb['name'] }
    
    # To allow a user to 'follow' the store
    
    
    #For a new review form on the store show page
    @review = Review.new
    
    #All reviews for this store
    @store_reviews = @store.reviews.paginate(page: params[:page], per_page: 5)
    
    #To display review statistics on store show page
    @average_rating = @store.reviews.average(:rating) if not @store.reviews.empty?
    @review_count = @store.reviews.count if not @store.reviews.empty?
    
  end

  # GET /stores/new
  def new
    if current_user.profile && current_user.store == nil
      @store = Store.new
    elsif current_user.store
      flash[:danger] = "You have already created a store."
      redirect_to root_path
    else
      flash[:danger] = "You must create a profile before opening a store."
      redirect_to new_profile_path
    end
  end

  # GET /stores/1/edit
  def edit
    authorize @store
  end

  # POST /stores
  # POST /stores.json
  def create
    
    if current_user.store == nil
      
      @store = Store.new(store_params)
      @store.user = current_user
      
      respond_to do |format|
        if @store.save
          format.html { redirect_to @store, notice: 'Store was successfully created.' }
          format.json { render :show, status: :created, location: @store }
        else
          format.html { render :new }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:danger] = "You have already created a store."
      redirect_to root_path
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    
    authorize @store
    
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    
    authorize @store
    
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :image, :remove_image, :address, :suburb, :state, :postcode, :about, :roasting_schedule, :next_roast, :pickup, :sort_by)
    end
  

end
