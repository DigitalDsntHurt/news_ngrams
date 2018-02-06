require 'test_helper'

class UrlQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url_queue = url_queues(:one)
  end

  test "should get index" do
    get url_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_url_queue_url
    assert_response :success
  end

  test "should create url_queue" do
    assert_difference('UrlQueue.count') do
      post url_queues_url, params: { url_queue: { date_added_to_queue: @url_queue.date_added_to_queue, date_scraped: @url_queue.date_scraped, publication: @url_queue.publication, url: @url_queue.url } }
    end

    assert_redirected_to url_queue_url(UrlQueue.last)
  end

  test "should show url_queue" do
    get url_queue_url(@url_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_queue_url(@url_queue)
    assert_response :success
  end

  test "should update url_queue" do
    patch url_queue_url(@url_queue), params: { url_queue: { date_added_to_queue: @url_queue.date_added_to_queue, date_scraped: @url_queue.date_scraped, publication: @url_queue.publication, url: @url_queue.url } }
    assert_redirected_to url_queue_url(@url_queue)
  end

  test "should destroy url_queue" do
    assert_difference('UrlQueue.count', -1) do
      delete url_queue_url(@url_queue)
    end

    assert_redirected_to url_queues_url
  end
end
