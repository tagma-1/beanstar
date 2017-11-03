class StorePolicy < ApplicationPolicy
  attr_reader :user, :store

  def initialize(user, store)
    @user = user
    @store = store
  end

  def edit?
    update?
  end
  
  def update?
    store.user == @user
  end

end