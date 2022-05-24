require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:coco)
    @session = sessions(:coco_session_one)
    @session.user_id = User.find_by(email: "coco@imagehawk.app")
  end

  test "should get index" do
    get sessions_path
    assert_response :success
  end

  test "should not get new if signed out" do
    sign_out users(:coco)
    get new_session_url
    assert_response :redirect
  end

  test "should get new if signed in" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post sessions_url, params: { session: { description: @session.description, title: @session.title, user: @session.user } }
    end

    assert_redirected_to session_url(Session.last)
  end

  test "should show session" do
    sign_out users(:coco)
    get session_url(@session)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_url(@session)
    assert_response :success
  end

  test "should update session" do
    patch session_url(@session), params: { session: { 
      description: @session.description,
      title: @session.title }}
    assert_redirected_to session_url(@session)
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete session_url(@session)
    end

    assert_redirected_to sessions_url
  end
end
