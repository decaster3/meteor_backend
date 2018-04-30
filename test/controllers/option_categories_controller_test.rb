require 'test_helper'

class OptionCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option_category = option_categories(:one)
  end

  test "should get index" do
    get option_categories_url, as: :json
    assert_response :success
  end

  test "should create option_category" do
    assert_difference('OptionCategory.count') do
      post option_categories_url, params: { option_category: { string: @option_category.string } }, as: :json
    end

    assert_response 201
  end

  test "should show option_category" do
    get option_category_url(@option_category), as: :json
    assert_response :success
  end

  test "should update option_category" do
    patch option_category_url(@option_category), params: { option_category: { string: @option_category.string } }, as: :json
    assert_response 200
  end

  test "should destroy option_category" do
    assert_difference('OptionCategory.count', -1) do
      delete option_category_url(@option_category), as: :json
    end

    assert_response 204
  end
end
