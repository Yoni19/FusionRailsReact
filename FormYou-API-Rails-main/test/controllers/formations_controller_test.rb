require 'test_helper'

class FormationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get formations_index_url
    assert_response :success
  end

  test "should get show" do
    get formations_show_url
    assert_response :success
  end

end
