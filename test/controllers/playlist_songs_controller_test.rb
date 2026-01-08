require "test_helper"

class PlaylistSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get playlist_songs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get playlist_songs_destroy_url
    assert_response :success
  end
end
