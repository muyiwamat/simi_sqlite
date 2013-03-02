class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      log_in @user
  		flash[:success] = "Account Successfully Created"
  		 redirect_to @user #changed this
  	else
  		render "new"
  	end

  end

  def edit
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def welcome
    @user = User.new #I think this makes sense
  end
end
