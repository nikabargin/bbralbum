require "application_system_test_case"

class LeathersTest < ApplicationSystemTestCase
  setup do
    @leather = leathers(:one)
  end

  test "visiting the index" do
    visit leathers_url
    assert_selector "h1", text: "Leathers"
  end

  test "creating a Leather" do
    visit leathers_url
    click_on "New Leather"

    fill_in "Color1", with: @leather.color1
    fill_in "Color2", with: @leather.color2
    fill_in "Color3", with: @leather.color3
    fill_in "Description", with: @leather.description
    fill_in "Hardness", with: @leather.hardness
    fill_in "Mprotection", with: @leather.mprotection
    fill_in "Name", with: @leather.name
    fill_in "Number", with: @leather.number
    fill_in "Sheen", with: @leather.sheen
    fill_in "Status", with: @leather.status
    fill_in "Texture", with: @leather.texture
    fill_in "Type", with: @leather.type
    click_on "Create Leather"

    assert_text "Leather was successfully created"
    click_on "Back"
  end

  test "updating a Leather" do
    visit leathers_url
    click_on "Edit", match: :first

    fill_in "Color1", with: @leather.color1
    fill_in "Color2", with: @leather.color2
    fill_in "Color3", with: @leather.color3
    fill_in "Description", with: @leather.description
    fill_in "Hardness", with: @leather.hardness
    fill_in "Mprotection", with: @leather.mprotection
    fill_in "Name", with: @leather.name
    fill_in "Number", with: @leather.number
    fill_in "Sheen", with: @leather.sheen
    fill_in "Status", with: @leather.status
    fill_in "Texture", with: @leather.texture
    fill_in "Type", with: @leather.type
    click_on "Update Leather"

    assert_text "Leather was successfully updated"
    click_on "Back"
  end

  test "destroying a Leather" do
    visit leathers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leather was successfully destroyed"
  end
end
