require 'test_helper'

class NoticesControllerTest < ActionController::TestCase

	

  	setup  do
  		@notice = create :notice
  		@teacher = create :teacher
  		@notice.noticable = @teacher
  		@notice.save
  		teacher_sign_in @teacher
  	end

  	test "should destroy notice with authorize user" do
  		delete :destroy, { id: @notice.id , format: :json }
  		assert_response :success
  	end

  	test "should read notice with authorize user" do
  		post :read, { id: @notice.id, format: :json }
  		assert_response :success
  	end

end
