class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Account Successfully Created"
  		redirect_to root_path #OR redirect_to @user
  	else
  		render "new"
  	end

  end

  def edit
  end

  def index
  end

  def show
  end

  def welcome
    @user = User.new #just temporarily...
  end
end
