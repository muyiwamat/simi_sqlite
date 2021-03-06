class SessionsController < ApplicationController
	
  def new
    
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:error] = 'Oops! Your email/password combination is wrong'
      redirect_to root_path
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end
end
