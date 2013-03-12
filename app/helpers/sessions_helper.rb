module SessionsHelper

	def log_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

   def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

    def current_user?(user)
    user == current_user
    end
  

  def log_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def admin?
     current_user == User.find_by_email("ayo@yahoo.com")
  end

end
