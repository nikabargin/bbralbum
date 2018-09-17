require 'test_helper'

class ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get colors_new_url
    assert_response :success
  end

  test "should get create" do
    get colors_create_url
    assert_response :success
  end

  test "should get edit" do
    get colors_edit_url
    assert_response :success
  end

  test "should get update" do
    get colors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get colors_destroy_url
    assert_response :success
  end

end
