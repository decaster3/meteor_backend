require 'test_helper'

class ProductOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_option = product_options(:one)
  end

  test "should get index" do
    get product_options_url, as: :json
    assert_response :success
  end

  test "should create product_option" do
    assert_difference('ProductOption.count') do
      post product_options_url, params: { product_option: { option_category_id: @product_option.option_category_id, option_category_option_id: @product_option.option_category_option_id } }, as: :json
    end

    assert_response 201
  end

  test "should show product_option" do
    get product_option_url(@product_option), as: :json
    assert_response :success
  end

  test "should update product_option" do
    patch product_option_url(@product_option), params: { product_option: { option_category_id: @product_option.option_category_id, option_category_option_id: @product_option.option_category_option_id } }, as: :json
    assert_response 200
  end

  test "should destroy product_option" do
    assert_difference('ProductOption.count', -1) do
      delete product_option_url(@product_option), as: :json
    end

    assert_response 204
  end
end
