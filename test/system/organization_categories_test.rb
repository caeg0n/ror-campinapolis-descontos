require "application_system_test_case"

class OrganizationCategoriesTest < ApplicationSystemTestCase
  setup do
    @organization_category = organization_categories(:one)
  end

  test "visiting the index" do
    visit organization_categories_url
    assert_selector "h1", text: "Organization categories"
  end

  test "should create organization category" do
    visit organization_categories_url
    click_on "New organization category"

    fill_in "Name", with: @organization_category.name
    click_on "Create Organization category"

    assert_text "Organization category was successfully created"
    click_on "Back"
  end

  test "should update Organization category" do
    visit organization_category_url(@organization_category)
    click_on "Edit this organization category", match: :first

    fill_in "Name", with: @organization_category.name
    click_on "Update Organization category"

    assert_text "Organization category was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization category" do
    visit organization_category_url(@organization_category)
    click_on "Destroy this organization category", match: :first

    assert_text "Organization category was successfully destroyed"
  end
end
