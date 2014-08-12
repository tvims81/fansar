class ApplicationController < ActionController::Base 
  respond_to :json, :xml, :html
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found  

  include ApplicationHelper
  include SessionsHelper

  private
 	
 	def record_not_found
      render json: "404 Not Found", status: 404
    end

end
