class SearchController < ApplicationController
	def index
		# @pages = Kaminari.paginate_array(@cds).page(params[:page]).per(3)
  	end

	def show
		if (params[:search]).empty?
			redirect_to current_user
			flash[:notice] = 'You supplied no value.'
		else
    		# @results = Book.where(:user_id => params[:id]) + Cd.where(:user_id => params[:id])
		end

	end
end
