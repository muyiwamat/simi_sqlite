class SearchController < ApplicationController
	include ApplicationHelper
	def index
		@libraries = Library.query(params[:search])
		# @pages = Kaminari.paginate_array(@libraries).page(params[:page]).per(3)
  	end

	def show
		# @libraries = Library.query(params[:search])
	end
end
