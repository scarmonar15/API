require 'test_helper'

class TeamsProjectsControllerTest < ActionController::TestCase
  setup do
    @teams_project = teams_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teams_project" do
    assert_difference('TeamsProject.count') do
      post :create, teams_project: { project_id: @teams_project.project_id, team_id: @teams_project.team_id }
    end

    assert_redirected_to teams_project_path(assigns(:teams_project))
  end

  test "should show teams_project" do
    get :show, id: @teams_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teams_project
    assert_response :success
  end

  test "should update teams_project" do
    patch :update, id: @teams_project, teams_project: { project_id: @teams_project.project_id, team_id: @teams_project.team_id }
    assert_redirected_to teams_project_path(assigns(:teams_project))
  end

  test "should destroy teams_project" do
    assert_difference('TeamsProject.count', -1) do
      delete :destroy, id: @teams_project
    end

    assert_redirected_to teams_projects_path
  end
end
