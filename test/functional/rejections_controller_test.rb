require 'test_helper'

class RejectionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rejections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rejection" do
    assert_difference('Rejection.count') do
      post :create, :rejection => { }
    end

    assert_redirected_to rejection_path(assigns(:rejection))
  end

  test "should show rejection" do
    get :show, :id => rejections(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rejections(:one).to_param
    assert_response :success
  end

  test "should update rejection" do
    put :update, :id => rejections(:one).to_param, :rejection => { }
    assert_redirected_to rejection_path(assigns(:rejection))
  end

  test "should destroy rejection" do
    assert_difference('Rejection.count', -1) do
      delete :destroy, :id => rejections(:one).to_param
    end

    assert_redirected_to rejections_path
  end
end
