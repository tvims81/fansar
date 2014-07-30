require 'test_helper'

class StudentsControllerTest < ActionController::TestCase

 	setup do
    	@student = create :student
    	@student_attr = attributes_for :student
    	@subject = create :subject
  	end

    teardown do
    	sign_out
    end




  test "should update_password" do
    student_sign_in @student
    post :update_password, { id: @student.id , student: { password: "111111", password_confirmation: "111111" }, format: :json }
    assert_response :success
  end

  test "should subscribe to subject with student" do
  	student_sign_in @student
  	post :subscribe_to_subject, { id: @student.id, subject_id: @subject.id, format: :json }
  	assert_response :success
  end


#  test "should update with authorized student" do
#		student_sign_in @student
#		post :update, { id: @student.id, student: { name: @student_attr[:name],
#			password: @student_attr[:password] }, format: :json }
#		assert_response :success
# end

  	test "should show with unauthenticated user" do
		get :show, { id: @student.id , format: :json }
		assert_response :forbidden
	end


	test "should show with authenticated student" do 
		student_sign_in @student
		get :show, { id: @student.id, format: :json }
    	assert_response :success
	end

	test "should show with unauthenticated student" do 
		get :show, { id: @student.id, format: :json }
    	assert_response :forbidden
	end


	test "should create with valid params" do
		post :create, { student: { email: "florentiyy@gmail.com", password: "111111" }, format: :json }
		assert_response :created
	end

	test "should create with invalid params" do
		post :create, { student: { email: "florentiyygmail.com", password: "" }, format: :json }
		assert_response :unprocessable_entity
	end


	test "should destroy with unauthorized user" do
		@unautorized_user = create :student
		student_sign_in @unautorized_user
		delete :destroy, { id: @student.id , format: :json }
		assert_response :unauthorized
	end

	test "should destroy with autorized student" do
		student_sign_in @student
		delete :destroy, { id: @student.id , format: :json }
		assert_response :success
	end

	

	test "should update with unauthorized user" do
		@unautorized_user = create :student
		student_sign_in @unautorized_user
		post :update, { id: @student.id, student: { name: @student_attr[:name], 
			password: @student_attr[:password] }, format: :json }
		assert_response :unauthorized
	end
	
	test "should index with with unauthenticated user" do
		get :index, format: :json
		assert_response :forbidden
	end

	test "should index with with authenticated user" do
		student_sign_in @student
		get :index, format: :json
		assert_response :success
	end

	test "should registration confirm" do
		get :registration_confirm, 
		{ id: @student.id, confirmation_token: @student.confirmation_token , format: :json }
		assert_response :success
	end
 	

end
