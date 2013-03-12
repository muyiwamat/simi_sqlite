class UsersController < ApplicationController
  include SessionsHelper

  before_filter :admin_user, only: :destroy

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      log_in @user
  		flash.now[:success] = "Account Successfully Created"
  		redirect_to @user #changed this
  	else
  		render "new"
  	end

  end

  def edit
    @user = User.find(params[:id])
  end

   def index
    @users = User.where(role: nil)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def show
    user_postcode = User.find(params[:id]).postcode 
    # user_postcode = "AB15 7RF"
    @user = User.find(params[:id])
    @libraries = Library.find(:all, conditions: ['postcode LIKE ?', user_postcode])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Update successful!"
      log_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  # def lib
  #   @user = User.find(params[:id])
  #   # search_condition =  "AB15 7RF"
  #   search_condition =  @user.postcode
  #   library = Library.find(:all, :conditions => ['postcode LIKE ?', search_condition])
  #   # if library.count > 0
  #   #   return @library = library
  #   # else
  #   #   return 'your search returned no result'
  #   # end
  # end

  def welcome
  end

   private

    def admin_user
      redirect_to(root_path) unless current_user.role == "admin"
    end

end
