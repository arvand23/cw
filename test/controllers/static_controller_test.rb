require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get experts" do
    get :experts
    assert_response :success
  end

  test "should get apply" do
    get :apply
    assert_response :success
  end

end
