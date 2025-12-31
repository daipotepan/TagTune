require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it "有効なファクトリを持つ" do
    expect(build(:playlist)).to be_valid
  end

  it "名前がなければ無効" do
    playlist = build(:playlist, name: nil)
    expect(playlist).not_to be_valid
  end

  it "ユーザーに属している" do
    playlist = build(:playlist)
    expect(playlist.user).to be_present
  end
end