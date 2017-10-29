require 'test_helper'

class SavedmsgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @savedmsg = savedmsgs(:one)
  end

  test "should get index" do
    get savedmsgs_url
    assert_response :success
  end

  test "should get new" do
    get new_savedmsg_url
    assert_response :success
  end

  test "should create savedmsg" do
    assert_difference('Savedmsg.count') do
      post savedmsgs_url, params: { savedmsg: { text: @savedmsg.text } }
    end

    assert_redirected_to savedmsg_url(Savedmsg.last)
  end

  test "should show savedmsg" do
    get savedmsg_url(@savedmsg)
    assert_response :success
  end

  test "should get edit" do
    get edit_savedmsg_url(@savedmsg)
    assert_response :success
  end

  test "should update savedmsg" do
    patch savedmsg_url(@savedmsg), params: { savedmsg: { text: @savedmsg.text } }
    assert_redirected_to savedmsg_url(@savedmsg)
  end

  test "should destroy savedmsg" do
    assert_difference('Savedmsg.count', -1) do
      delete savedmsg_url(@savedmsg)
    end

    assert_redirected_to savedmsgs_url
  end
end
