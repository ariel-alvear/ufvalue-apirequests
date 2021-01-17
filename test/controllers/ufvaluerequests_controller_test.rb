require "test_helper"

class UfvaluerequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ufvaluerequest = ufvaluerequests(:one)
  end

  test "should get index" do
    get ufvaluerequests_url, as: :json
    assert_response :success
  end

  test "should create ufvaluerequest" do
    assert_difference('Ufvaluerequest.count') do
      post ufvaluerequests_url, params: { ufvaluerequest: { client: @ufvaluerequest.client, requestedDate: @ufvaluerequest.requestedDate, ufvalue: @ufvaluerequest.ufvalue } }, as: :json
    end

    assert_response 201
  end

  test "should show ufvaluerequest" do
    get ufvaluerequest_url(@ufvaluerequest), as: :json
    assert_response :success
  end

  test "should update ufvaluerequest" do
    patch ufvaluerequest_url(@ufvaluerequest), params: { ufvaluerequest: { client: @ufvaluerequest.client, requestedDate: @ufvaluerequest.requestedDate, ufvalue: @ufvaluerequest.ufvalue } }, as: :json
    assert_response 200
  end

  test "should destroy ufvaluerequest" do
    assert_difference('Ufvaluerequest.count', -1) do
      delete ufvaluerequest_url(@ufvaluerequest), as: :json
    end

    assert_response 204
  end
end
