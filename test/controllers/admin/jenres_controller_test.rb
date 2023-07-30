require "test_helper"

class Admin::JenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_jenres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_jenres_edit_url
    assert_response :success
  end
end
