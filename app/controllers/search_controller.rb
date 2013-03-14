class SearchController < ApplicationController
	include ApplicationHelper
	include SessionsHelper
	def index
      search = "%#{:search.upcase}%"
		@libraries = Library.query(params[search])
  	end

	def show
		gon.mypostcode = params[:id]
	end
end
