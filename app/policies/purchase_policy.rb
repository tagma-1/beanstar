class PurchasePolicy < ApplicationPolicy
  attr_reader :user, :purchase

  def initialize(user, purchase)
    @user = user
    @purchase = purchase
  end

  def show?
    purchase.user == @user
  end

end