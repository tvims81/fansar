require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  
  setup do
    @subject = create :subject
  	@lecture = create :lecture
  	@lecture_attr = attributes_for :lecture
  	@student = create :student
  	@teacher = @lecture.teacher
    @unauthorized_teacher = create :teacher
	  teacher_sign_in @teacher
  end



  test "should create with valid params" do
  	post :create, { lecture: { subject_id: @subject.id, name: @lecture_attr[:name] }, format: :json }
  	assert_response :success 
  end

  test "should create with invalid params" do
  	post :create, { lecture: { subject_id: @subject.id, name: "" }, format: :json }
  	assert_response :unprocessable_entity
  end

  test "should create with student" do
  	student_sign_in @student
  	post :create, { lecture: { name: @lecture_attr[:name] }, format: :json }
  	assert_response :unauthorized
  end

  test "should show with unauthenticate user" do
  	sign_out
  	get :show, { id: @lecture.id, format: :json }
  	assert_response :forbidden
  end

  test "should show with authenticate user" do
  	get :show, { id: @lecture.id, format: :json }
  	assert_response :success
  end

  test "should index with unauthenticate user" do
    sign_out
    get :index, { format: :json }
    assert_response :forbidden
  end

  test "should index with authenticate user" do
    get :index, { format: :json } 
    assert_response :success
  end

  test "should destroy with creator" do
    delete :destroy, { id: @lecture.id, format: :json }
    assert_response :success
  end

  test "should destroy with not creator" do
    sign_out
    teacher_sign_in @unauthorized_teacher
    delete :destroy, { id: @lecture.id, format: :json }
    assert_response :unauthorized
  end

  test "should update with creator" do
    post :update, { id: @lecture.id, lecture: { name: @lecture_attr[:name] }, format: :json }
    assert_response :success
  end

  test "should update with not creator" do
    sign_out
    teacher_sign_in @unauthorized_teacher
    post :update, { id: @lecture.id, lecture: { name: @lecture_attr[:name] }, format: :json }
    assert_response :unauthorized
  end

end
