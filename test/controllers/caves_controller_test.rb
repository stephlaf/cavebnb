require 'test_helper'

class CavesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get caves_index_url
    assert_response :success
  end

  test "should get show" do
    get caves_show_url
    assert_response :success
  end

  test "should get new" do
    get caves_new_url
    assert_response :success
  end

  test "should get create" do
    get caves_create_url
    assert_response :success
  end

  test "should get edit" do
    get caves_edit_url
    assert_response :success
  end

  test "should get update" do
    get caves_update_url
    assert_response :success
  end

  test "should get destroy" do
    get caves_destroy_url
    assert_response :success
  end

end
