require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get invite" do
    get invitations_invite_url
    assert_response :success
  end
end
