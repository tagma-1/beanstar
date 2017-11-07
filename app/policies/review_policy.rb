class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end
  
  def create?
    review.user == @user
  end
  
  def edit?
    update?
  end
  
  def update?
    review.user == @user
  end
  
  def destroy?
    review.user == @user
  end

end