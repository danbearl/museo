require 'test_helper'

class ImageControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get destory" do
    get :destory
    assert_response :success
  end

  test "should get move" do
    get :move
    assert_response :success
  end

end
