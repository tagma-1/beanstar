class PagesController < ApplicationController
  
  def home
    @user_profile = Profile.find_by(user_id: current_user.id)
  end

end