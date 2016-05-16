require 'test_helper'

class StudentsTasksControllerTest < ActionController::TestCase
  setup do
    @students_task = students_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create students_task" do
    assert_difference('StudentsTask.count') do
      post :create, students_task: { student_id: @students_task.student_id, task_id: @students_task.task_id }
    end

    assert_redirected_to students_task_path(assigns(:students_task))
  end

  test "should show students_task" do
    get :show, id: @students_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @students_task
    assert_response :success
  end

  test "should update students_task" do
    patch :update, id: @students_task, students_task: { student_id: @students_task.student_id, task_id: @students_task.task_id }
    assert_redirected_to students_task_path(assigns(:students_task))
  end

  test "should destroy students_task" do
    assert_difference('StudentsTask.count', -1) do
      delete :destroy, id: @students_task
    end

    assert_redirected_to students_tasks_path
  end
end
