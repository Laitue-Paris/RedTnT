require "test_helper"

class ClothesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothes_index_url
    assert_response :success
  end

  test "should get show" do
    get clothes_show_url
    assert_response :success
  end

  test "should get create" do
    get clothes_create_url
    assert_response :success
  end
end
