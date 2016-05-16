require 'test_helper'

class LearningsStudentsControllerTest < ActionController::TestCase
  setup do
    @learnings_student = learnings_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learnings_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learnings_student" do
    assert_difference('LearningsStudent.count') do
      post :create, learnings_student: { learning_id: @learnings_student.learning_id, student_id: @learnings_student.student_id }
    end

    assert_redirected_to learnings_student_path(assigns(:learnings_student))
  end

  test "should show learnings_student" do
    get :show, id: @learnings_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learnings_student
    assert_response :success
  end

  test "should update learnings_student" do
    patch :update, id: @learnings_student, learnings_student: { learning_id: @learnings_student.learning_id, student_id: @learnings_student.student_id }
    assert_redirected_to learnings_student_path(assigns(:learnings_student))
  end

  test "should destroy learnings_student" do
    assert_difference('LearningsStudent.count', -1) do
      delete :destroy, id: @learnings_student
    end

    assert_redirected_to learnings_students_path
  end
end
