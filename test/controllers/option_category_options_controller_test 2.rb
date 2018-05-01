require 'test_helper'

class OptionCategoryOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option_category_option = option_category_options(:one)
  end

  test "should get index" do
    get option_category_options_url, as: :json
    assert_response :success
  end

  test "should create option_category_option" do
    assert_difference('OptionCategoryOption.count') do
      post option_category_options_url, params: { option_category_option: { string: @option_category_option.string } }, as: :json
    end

    assert_response 201
  end

  test "should show option_category_option" do
    get option_category_option_url(@option_category_option), as: :json
    assert_response :success
  end

  test "should update option_category_option" do
    patch option_category_option_url(@option_category_option), params: { option_category_option: { string: @option_category_option.string } }, as: :json
    assert_response 200
  end

  test "should destroy option_category_option" do
    assert_difference('OptionCategoryOption.count', -1) do
      delete option_category_option_url(@option_category_option), as: :json
    end

    assert_response 204
  end
end
