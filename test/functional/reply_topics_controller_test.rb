require 'test_helper'

class ReplyTopicsControllerTest < ActionController::TestCase
  setup do
    @reply_topic = reply_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reply_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reply_topic" do
    assert_difference('ReplyTopic.count') do
      post :create, reply_topic: @reply_topic.attributes
    end

    assert_redirected_to reply_topic_path(assigns(:reply_topic))
  end

  test "should show reply_topic" do
    get :show, id: @reply_topic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reply_topic.to_param
    assert_response :success
  end

  test "should update reply_topic" do
    put :update, id: @reply_topic.to_param, reply_topic: @reply_topic.attributes
    assert_redirected_to reply_topic_path(assigns(:reply_topic))
  end

  test "should destroy reply_topic" do
    assert_difference('ReplyTopic.count', -1) do
      delete :destroy, id: @reply_topic.to_param
    end

    assert_redirected_to reply_topics_path
  end
end
