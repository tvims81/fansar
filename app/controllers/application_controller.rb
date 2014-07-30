class ApplicationController < ActionController::Base 
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found  

  include ApplicationHelper

  private
 	
 	def record_not_found
      render json: "404 Not Found", status: 404
    end

end
