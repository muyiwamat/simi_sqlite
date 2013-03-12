class SearchController < ApplicationController
	include ApplicationHelper
	include SessionsHelper
	def index
		@libraries = Library.query(params[:search])
  	end

	def show
		gon.mypostcode = params[:id]
	end
end
