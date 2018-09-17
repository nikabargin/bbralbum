require 'test_helper'

class HardnessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hardnesses_new_url
    assert_response :success
  end

  test "should get create" do
    get hardnesses_create_url
    assert_response :success
  end

  test "should get edit" do
    get hardnesses_edit_url
    assert_response :success
  end

  test "should get update" do
    get hardnesses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hardnesses_destroy_url
    assert_response :success
  end

end
