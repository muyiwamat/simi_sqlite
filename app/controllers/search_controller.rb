class SearchController < ApplicationController
	include ApplicationHelper
	include SessionsHelper
	def index
		@libraries = Library.query(params[:search])
		# @pages = Kaminari.paginate_array(@libraries).page(params[:page]).per(3)
  	end

	def show
		# @libraries = Library.query(params[:search])
		gon.mypostcode = params[:id]
		# gon.myp = params[:id]
	end
end
