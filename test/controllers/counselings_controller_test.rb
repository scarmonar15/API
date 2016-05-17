require 'test_helper'

class CounselingsControllerTest < ActionController::TestCase
  setup do
    @counseling = counselings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counselings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counseling" do
    assert_difference('Counseling.count') do
      post :create, counseling: { adviser: @counseling.adviser, classroom: @counseling.classroom, date: @counseling.date }
    end

    assert_redirected_to counseling_path(assigns(:counseling))
  end

  test "should show counseling" do
    get :show, id: @counseling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @counseling
    assert_response :success
  end

  test "should update counseling" do
    patch :update, id: @counseling, counseling: { adviser: @counseling.adviser, classroom: @counseling.classroom, date: @counseling.date }
    assert_redirected_to counseling_path(assigns(:counseling))
  end

  test "should destroy counseling" do
    assert_difference('Counseling.count', -1) do
      delete :destroy, id: @counseling
    end

    assert_redirected_to counselings_path
  end
end
