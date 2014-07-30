require 'test_helper'

class HomeworksControllerTest < ActionController::TestCase
  setup do
  	@student = create :student
  	@homework = create :homework
  	@hw_attr = attributes_for :homework
  	@hw_creator_student = @homework.student
  	@hw_lecture = @homework.lecture
  	@lecture_creator_teacher = @hw_lecture.teacher
  	student_sign_in @hw_creator_student
  end



  test "should create with student" do
  	@lecture = create :lecture 
    post :create, { lecture_id: @lecture.id, homework: { documents_attributes: { } }, format: :json }
  	assert_response :created
  end

  test "should create with teacher" do
    @lecture = create :lecture 
  	@teacher = create :teacher
  	teacher_sign_in @teacher
  	post :create, { lecture_id: @lecture.id, homework: { documents_attributes: { } }, format: :json }
  	assert_response :unauthorized
  end

  test "should create with unauthenticated user" do
    @lecture = create :lecture 
  	sign_out
  	post :create, { lecture_id: @lecture.id, homework: { documents_attributes: { } }, format: :json }
  	assert_response :forbidden
  end


  test "should destroy with unauthorized student" do
    student_sign_in @student
    delete :destroy, { lecture_id: @hw_lecture, id: @homework.id, format: :json }
    assert_response :unauthorized
  end

  test "should destroy with authorized student" do
    delete :destroy, { lecture_id: @hw_lecture, id: @homework.id, format: :json }
    assert_response :success
  end

  test "should update with authorized student" do
    post :update, { lecture_id: @hw_lecture, id: @homework.id, homework: { documents_attributes: { } }, format: :json }
    assert_response :success
  end
  
  test "should update with unauthorized student" do
    student_sign_in @student
    post :update, { lecture_id: @hw_lecture, id: @homework.id, homework: { documents_attributes: { } } , format: :json }
    assert_response :unauthorized
  end

  test "should rate homework with authorized teacher" do
    teacher_sign_in @lecture_creator_teacher
    post :rate,  { lecture_id: @hw_lecture, id: @homework.id, score: '100' }
    assert_response :success
  end

end
