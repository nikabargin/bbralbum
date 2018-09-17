require 'test_helper'

class TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get targets_new_url
    assert_response :success
  end

  test "should get create" do
    get targets_create_url
    assert_response :success
  end

  test "should get edit" do
    get targets_edit_url
    assert_response :success
  end

  test "should get update" do
    get targets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get targets_destroy_url
    assert_response :success
  end

end
