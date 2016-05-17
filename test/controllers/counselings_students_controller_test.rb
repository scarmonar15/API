require 'test_helper'

class CounselingsStudentsControllerTest < ActionController::TestCase
  setup do
    @counselings_student = counselings_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counselings_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counselings_student" do
    assert_difference('CounselingsStudent.count') do
      post :create, counselings_student: { counseling_id: @counselings_student.counseling_id, student_id: @counselings_student.student_id }
    end

    assert_redirected_to counselings_student_path(assigns(:counselings_student))
  end

  test "should show counselings_student" do
    get :show, id: @counselings_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @counselings_student
    assert_response :success
  end

  test "should update counselings_student" do
    patch :update, id: @counselings_student, counselings_student: { counseling_id: @counselings_student.counseling_id, student_id: @counselings_student.student_id }
    assert_redirected_to counselings_student_path(assigns(:counselings_student))
  end

  test "should destroy counselings_student" do
    assert_difference('CounselingsStudent.count', -1) do
      delete :destroy, id: @counselings_student
    end

    assert_redirected_to counselings_students_path
  end
end
