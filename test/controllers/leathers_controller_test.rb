require 'test_helper'

class LeathersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leather = leathers(:one)
  end

  test "should get index" do
    get leathers_url
    assert_response :success
  end

  test "should get new" do
    get new_leather_url
    assert_response :success
  end

  test "should create leather" do
    assert_difference('Leather.count') do
      post leathers_url, params: { leather: { color1: @leather.color1, color2: @leather.color2, color3: @leather.color3, description: @leather.description, hardness: @leather.hardness, mprotection: @leather.mprotection, name: @leather.name, number: @leather.number, sheen: @leather.sheen, status: @leather.status, texture: @leather.texture, type: @leather.type } }
    end

    assert_redirected_to leather_url(Leather.last)
  end

  test "should show leather" do
    get leather_url(@leather)
    assert_response :success
  end

  test "should get edit" do
    get edit_leather_url(@leather)
    assert_response :success
  end

  test "should update leather" do
    patch leather_url(@leather), params: { leather: { color1: @leather.color1, color2: @leather.color2, color3: @leather.color3, description: @leather.description, hardness: @leather.hardness, mprotection: @leather.mprotection, name: @leather.name, number: @leather.number, sheen: @leather.sheen, status: @leather.status, texture: @leather.texture, type: @leather.type } }
    assert_redirected_to leather_url(@leather)
  end

  test "should destroy leather" do
    assert_difference('Leather.count', -1) do
      delete leather_url(@leather)
    end

    assert_redirected_to leathers_url
  end
end
