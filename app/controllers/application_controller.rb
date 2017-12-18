class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



 def after_sign_in_path_for(resource)
  sign_in_url = new_exam_url
  #   if resource.admin
  #   redirect_to new_exam_path
  #   else 
  #   redirect_to root_path
  #   end
   end

end
