class FollowersController < ApplicationController

def create
  
  store_params = params.permit(:store_id)[:store_id]
  
  Store.find(store_params).followers << current_user
  redirect_to store_path(store_params)
  
end

def destroy
  
  store_params = params.permit(:store_id)[:store_id]
  
  Store.find(store_params).followers.delete(current_user)
  redirect_to store_path(store_params)
  
end

end