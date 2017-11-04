class ListingPolicy < ApplicationPolicy
  attr_reader :user, :listing

  def initialize(user, listing)
    @user = user
    @listing = listing
  end

  def edit?
    update?
  end
  
  def update?
    listing.store.user == @user
  end

end