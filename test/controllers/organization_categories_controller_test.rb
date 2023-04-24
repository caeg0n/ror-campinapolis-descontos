require "test_helper"

class OrganizationCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_category = organization_categories(:one)
  end

  test "should get index" do
    get organization_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_category_url
    assert_response :success
  end

  test "should create organization_category" do
    assert_difference("OrganizationCategory.count") do
      post organization_categories_url, params: { organization_category: { name: @organization_category.name } }
    end

    assert_redirected_to organization_category_url(OrganizationCategory.last)
  end

  test "should show organization_category" do
    get organization_category_url(@organization_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_category_url(@organization_category)
    assert_response :success
  end

  test "should update organization_category" do
    patch organization_category_url(@organization_category), params: { organization_category: { name: @organization_category.name } }
    assert_redirected_to organization_category_url(@organization_category)
  end

  test "should destroy organization_category" do
    assert_difference("OrganizationCategory.count", -1) do
      delete organization_category_url(@organization_category)
    end

    assert_redirected_to organization_categories_url
  end
end
