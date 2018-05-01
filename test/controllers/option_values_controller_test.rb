require 'test_helper'

class OptionValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option_value = option_values(:one)
  end

  test "should get index" do
    get option_values_url, as: :json
    assert_response :success
  end

  test "should create option_value" do
    assert_difference('OptionValue.count') do
      post option_values_url, params: { option_value: { option_name_id: @option_value.option_name_id, value: @option_value.value } }, as: :json
    end

    assert_response 201
  end

  test "should show option_value" do
    get option_value_url(@option_value), as: :json
    assert_response :success
  end

  test "should update option_value" do
    patch option_value_url(@option_value), params: { option_value: { option_name_id: @option_value.option_name_id, value: @option_value.value } }, as: :json
    assert_response 200
  end

  test "should destroy option_value" do
    assert_difference('OptionValue.count', -1) do
      delete option_value_url(@option_value), as: :json
    end

    assert_response 204
  end
end
