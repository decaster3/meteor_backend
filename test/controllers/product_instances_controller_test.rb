require 'test_helper'

class ProductInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_instance = product_instances(:one)
  end

  test "should get index" do
    get product_instances_url, as: :json
    assert_response :success
  end

  test "should create product_instance" do
    assert_difference('ProductInstance.count') do
      post product_instances_url, params: { product_instance: { product_id: @product_instance.product_id } }, as: :json
    end

    assert_response 201
  end

  test "should show product_instance" do
    get product_instance_url(@product_instance), as: :json
    assert_response :success
  end

  test "should update product_instance" do
    patch product_instance_url(@product_instance), params: { product_instance: { product_id: @product_instance.product_id } }, as: :json
    assert_response 200
  end

  test "should destroy product_instance" do
    assert_difference('ProductInstance.count', -1) do
      delete product_instance_url(@product_instance), as: :json
    end

    assert_response 204
  end
end
