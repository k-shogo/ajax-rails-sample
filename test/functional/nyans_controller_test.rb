require 'test_helper'

class NyansControllerTest < ActionController::TestCase
  setup do
    @nyan = nyans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nyans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nyan" do
    assert_difference('Nyan.count') do
      post :create, nyan: { title: @nyan.title }
    end

    assert_redirected_to nyan_path(assigns(:nyan))
  end

  test "should show nyan" do
    get :show, id: @nyan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nyan
    assert_response :success
  end

  test "should update nyan" do
    put :update, id: @nyan, nyan: { title: @nyan.title }
    assert_redirected_to nyan_path(assigns(:nyan))
  end

  test "should destroy nyan" do
    assert_difference('Nyan.count', -1) do
      delete :destroy, id: @nyan
    end

    assert_redirected_to nyans_path
  end
end
