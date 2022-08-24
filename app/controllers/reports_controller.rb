require 'reports'
class ReportsController < ApplicationController

	def index
		@candidates = Reports.get_user_reports(params[:report]) if params[:report].present?
	end
end
