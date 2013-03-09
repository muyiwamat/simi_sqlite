class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # private #TRY OUT THIS METHOD OF CREATING AND USING COOKIES
  # http://rails.nuvvo.com/lesson/6372-action-controller-session
  # http://guides.rubyonrails.org/action_controller_overview.html#session
  # def current_user
  # 	session[:remember_token] = user.id
  #   @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  # end

end
