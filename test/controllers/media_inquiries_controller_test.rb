require 'test_helper'

class MediaInquiriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_inquiry = media_inquiries(:one)
  end

  test "should get index" do
    get media_inquiries_url
    assert_response :success
  end

  test "should get new" do
    get new_media_inquiry_url
    assert_response :success
  end

  test "should create media_inquiry" do
    assert_difference('MediaInquiry.count') do
      post media_inquiries_url, params: { media_inquiry: {  } }
    end

    assert_redirected_to media_inquiry_url(MediaInquiry.last)
  end

  test "should show media_inquiry" do
    get media_inquiry_url(@media_inquiry)
    assert_response :success
  end

  test "should get edit" do
    get edit_media_inquiry_url(@media_inquiry)
    assert_response :success
  end

  test "should update media_inquiry" do
    patch media_inquiry_url(@media_inquiry), params: { media_inquiry: {  } }
    assert_redirected_to media_inquiry_url(@media_inquiry)
  end

  test "should destroy media_inquiry" do
    assert_difference('MediaInquiry.count', -1) do
      delete media_inquiry_url(@media_inquiry)
    end

    assert_redirected_to media_inquiries_url
  end
end
