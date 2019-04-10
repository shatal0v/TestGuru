require 'test_helper'

class Admin::BagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_bages_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_bages_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bages_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_bages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_bages_destroy_url
    assert_response :success
  end

end
