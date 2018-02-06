require 'test_helper'

class NgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ngram = ngrams(:one)
  end

  test "should get index" do
    get ngrams_url
    assert_response :success
  end

  test "should get new" do
    get new_ngram_url
    assert_response :success
  end

  test "should create ngram" do
    assert_difference('Ngram.count') do
      post ngrams_url, params: { ngram: { date: @ngram.date, n: @ngram.n, occurrences: @ngram.occurrences, terms: @ngram.terms } }
    end

    assert_redirected_to ngram_url(Ngram.last)
  end

  test "should show ngram" do
    get ngram_url(@ngram)
    assert_response :success
  end

  test "should get edit" do
    get edit_ngram_url(@ngram)
    assert_response :success
  end

  test "should update ngram" do
    patch ngram_url(@ngram), params: { ngram: { date: @ngram.date, n: @ngram.n, occurrences: @ngram.occurrences, terms: @ngram.terms } }
    assert_redirected_to ngram_url(@ngram)
  end

  test "should destroy ngram" do
    assert_difference('Ngram.count', -1) do
      delete ngram_url(@ngram)
    end

    assert_redirected_to ngrams_url
  end
end
