require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get general" do
    get statistics_general_url
    assert_response :success
  end

  test "should get personalized" do
    get statistics_personalized_url
    assert_response :success
  end

  test "should get recommendations" do
    get statistics_recommendations_url
    assert_response :success
  end
end
