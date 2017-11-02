class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  
 private

 def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:danger] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
   redirect_to(request.referrer || root_path)
 end
 
end
