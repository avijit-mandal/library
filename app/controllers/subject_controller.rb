class SubjectController < ApplicationController
	def new
	end

	def create
	end

	def show
		@subject = Subject.find(params[:id])
	end
end
