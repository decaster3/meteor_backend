require 'test_helper'

class OptionNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option_name = option_names(:one)
  end

  test "should get index" do
    get option_names_url, as: :json
    assert_response :success
  end

  test "should create option_name" do
    assert_difference('OptionName.count') do
      post option_names_url, params: { option_name: { name: @option_name.name } }, as: :json
    end

    assert_response 201
  end

  test "should show option_name" do
    get option_name_url(@option_name), as: :json
    assert_response :success
  end

  test "should update option_name" do
    patch option_name_url(@option_name), params: { option_name: { name: @option_name.name } }, as: :json
    assert_response 200
  end

  test "should destroy option_name" do
    assert_difference('OptionName.count', -1) do
      delete option_name_url(@option_name), as: :json
    end

    assert_response 204
  end
end
