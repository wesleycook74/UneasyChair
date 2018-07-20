require 'test_helper'

class RebuttlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rebuttle = rebuttles(:one)
  end

  test "should get index" do
    get rebuttles_url
    assert_response :success
  end

  test "should get new" do
    get new_rebuttle_url
    assert_response :success
  end

  test "should create rebuttle" do
    assert_difference('Rebuttle.count') do
      post rebuttles_url, params: { rebuttle: { authorrebuttle: @rebuttle.authorrebuttle, reviewID: @rebuttle.reviewID } }
    end

    assert_redirected_to rebuttle_url(Rebuttle.last)
  end

  test "should show rebuttle" do
    get rebuttle_url(@rebuttle)
    assert_response :success
  end

  test "should get edit" do
    get edit_rebuttle_url(@rebuttle)
    assert_response :success
  end

  test "should update rebuttle" do
    patch rebuttle_url(@rebuttle), params: { rebuttle: { authorrebuttle: @rebuttle.authorrebuttle, reviewID: @rebuttle.reviewID } }
    assert_redirected_to rebuttle_url(@rebuttle)
  end

  test "should destroy rebuttle" do
    assert_difference('Rebuttle.count', -1) do
      delete rebuttle_url(@rebuttle)
    end

    assert_redirected_to rebuttles_url
  end
end
