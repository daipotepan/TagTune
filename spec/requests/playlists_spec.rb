require 'rails_helper'

RSpec.describe "Playlists", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user, scope: :user
  end

  describe "GET /playlists" do
    it "一覧が表示される" do
      get playlists_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /playlists" do
    it "プレイリストを作成できる" do
      expect {
        post playlists_path, params: {
          playlist: { name: "Test Playlist" }
        }
      }.to change(Playlist, :count).by(1)
    end
  end
end