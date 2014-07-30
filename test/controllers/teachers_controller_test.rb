require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  
  	setup do
    	@teacher = create :teacher
    	@teacher_attr = attributes_for :teacher
  	end

  	teardown do
    	sign_out
  	end


    test "should update_password" do
      teacher_sign_in @teacher
      post :update_password, { id: @teacher.id , teacher: { password: "111111", password_confirmation: "111111" }, format: :json }
      assert_response :success
    end

 # test "should update with authorized teacher" do
#		teacher_sign_in @teacher
#		post :update, { id: @teacher.id, teacher: { name: @teacher_attr[:name] ,
#			password: @teacher_attr[:password] }, format: :json }
#		assert_response :success
#  end



  test "should show with unauthenticated user" do
		get :show, { id: @teacher.id , format: :json }
		assert_response :forbidden
	end


	test "should show with teacher" do 
		teacher_sign_in @teacher
		get :show, { id: @teacher.id, format: :json }
    	assert_response :success
	end


	test "should create" do
		post :create, { teacher: { email: "1nsaffff@mail.ru", password: "111111" }, format: :json }
		assert_response :success
	end


	test "should destroy with unauthorized user" do
		@unautorized_user = create :teacher
		teacher_sign_in @unautorized_user
		delete :destroy, { id: @teacher.id , format: :json }
		assert_response :unauthorized
	end

	test "should destroy with authorized teacher" do
		teacher_sign_in @teacher
		delete :destroy, { id: @teacher.id , format: :json }
		assert_response :success
	end

	

	test "should update with unauthorized user" do
		@unautorized_user = create :teacher
		teacher_sign_in @unautorized_user
		post :update, { id: @teacher.id, teacher: { name: @teacher_attr[:name], }, format: :json }
		assert_response :unauthorized
	end
	
	test "should index with with unauthenticated user" do
		get :index, format: :json
		assert_response :forbidden
	end

	test "should index with with authenticated user" do
		teacher_sign_in @teacher
		get :index, format: :json
		assert_response :success
	end

	test "should registration confirm" do
		get :registration_confirm, 
		{ id: @teacher.id, confirmation_token: @teacher.confirmation_token , format: :json }
		assert_response :success
	end


end
