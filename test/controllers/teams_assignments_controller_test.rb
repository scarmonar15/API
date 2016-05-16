require 'test_helper'

class TeamsAssignmentsControllerTest < ActionController::TestCase
  setup do
    @teams_assignment = teams_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teams_assignment" do
    assert_difference('TeamsAssignment.count') do
      post :create, teams_assignment: { assignment_id: @teams_assignment.assignment_id, team_id: @teams_assignment.team_id }
    end

    assert_redirected_to teams_assignment_path(assigns(:teams_assignment))
  end

  test "should show teams_assignment" do
    get :show, id: @teams_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teams_assignment
    assert_response :success
  end

  test "should update teams_assignment" do
    patch :update, id: @teams_assignment, teams_assignment: { assignment_id: @teams_assignment.assignment_id, team_id: @teams_assignment.team_id }
    assert_redirected_to teams_assignment_path(assigns(:teams_assignment))
  end

  test "should destroy teams_assignment" do
    assert_difference('TeamsAssignment.count', -1) do
      delete :destroy, id: @teams_assignment
    end

    assert_redirected_to teams_assignments_path
  end
end
