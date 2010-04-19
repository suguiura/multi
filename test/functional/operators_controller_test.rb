require 'test_helper'

class OperatorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operator" do
    assert_difference('Operator.count') do
      post :create, :operator => { }
    end

    assert_redirected_to operator_path(assigns(:operator))
  end

  test "should show operator" do
    get :show, :id => operators(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => operators(:one).to_param
    assert_response :success
  end

  test "should update operator" do
    put :update, :id => operators(:one).to_param, :operator => { }
    assert_redirected_to operator_path(assigns(:operator))
  end

  test "should destroy operator" do
    assert_difference('Operator.count', -1) do
      delete :destroy, :id => operators(:one).to_param
    end

    assert_redirected_to operators_path
  end
end
