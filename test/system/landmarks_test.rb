require "application_system_test_case"

class LandmarksTest < ApplicationSystemTestCase
  setup do
    @landmark = landmarks(:one)
  end

  test "visiting the index" do
    visit landmarks_url
    assert_selector "h1", text: "Landmarks"
  end

  test "creating a Landmark" do
    visit landmarks_url
    click_on "New Landmark"

    fill_in "Answer1", with: @landmark.answer1
    fill_in "Answer2", with: @landmark.answer2
    fill_in "Answer3", with: @landmark.answer3
    fill_in "Author", with: @landmark.author
    fill_in "Correct", with: @landmark.correct
    fill_in "Hiragana", with: @landmark.hiragana
    fill_in "Latitude", with: @landmark.latitude
    fill_in "Longitude", with: @landmark.longitude
    fill_in "Name", with: @landmark.name
    fill_in "Question", with: @landmark.question
    fill_in "Url", with: @landmark.url
    click_on "Create Landmark"

    assert_text "Landmark was successfully created"
    click_on "Back"
  end

  test "updating a Landmark" do
    visit landmarks_url
    click_on "Edit", match: :first

    fill_in "Answer1", with: @landmark.answer1
    fill_in "Answer2", with: @landmark.answer2
    fill_in "Answer3", with: @landmark.answer3
    fill_in "Author", with: @landmark.author
    fill_in "Correct", with: @landmark.correct
    fill_in "Hiragana", with: @landmark.hiragana
    fill_in "Latitude", with: @landmark.latitude
    fill_in "Longitude", with: @landmark.longitude
    fill_in "Name", with: @landmark.name
    fill_in "Question", with: @landmark.question
    fill_in "Url", with: @landmark.url
    click_on "Update Landmark"

    assert_text "Landmark was successfully updated"
    click_on "Back"
  end

  test "destroying a Landmark" do
    visit landmarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Landmark was successfully destroyed"
  end
end
