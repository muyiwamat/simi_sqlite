class UsersController < ApplicationController
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
  end

  def show
    @user = User.find(params[:id])
    @a = lib
  end

  def lib
    @user = User.find(params[:id])
    # search_condition =  @user.postcode #"%#{search}%"
    search_condition =  "AB15 7RF" 
    library = Library.find(:all, :conditions => ['postcode LIKE ?', search_condition])
    if library.count > 0
      return @library = library
    else
      return 'your search returned no result'
    end
  end

  def welcome
  end
end
