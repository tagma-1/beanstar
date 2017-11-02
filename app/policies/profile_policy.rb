class ProfilePolicy < ApplicationPolicy
  attr_reader :user, :profile

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def edit?
    update?
  end
  
  def update?
    profile.user == @user
  end

end