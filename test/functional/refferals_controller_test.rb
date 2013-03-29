require 'test_helper'

class RefferalsControllerTest < ActionController::TestCase
  setup do
    @refferal = refferals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refferals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refferal" do
    assert_difference('Refferal.count') do
      post :create, refferal: { description: @refferal.description }
    end

    assert_redirected_to refferal_path(assigns(:refferal))
  end

  test "should show refferal" do
    get :show, id: @refferal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refferal
    assert_response :success
  end

  test "should update refferal" do
    put :update, id: @refferal, refferal: { description: @refferal.description }
    assert_redirected_to refferal_path(assigns(:refferal))
  end

  test "should destroy refferal" do
    assert_difference('Refferal.count', -1) do
      delete :destroy, id: @refferal
    end

    assert_redirected_to refferals_path
  end
end
