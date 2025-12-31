require 'rails_helper'

RSpec.describe "Playlists", type: :system do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit playlists_path
  end

  it "プレイリスト一覧が表示される" do
    expect(page).to have_content("プレイリスト")
    expect(page).to have_link("＋ 新規作成")
  end

  it "プレイリストを作成できる" do
    click_link "＋ 新規作成"

    fill_in "プレイリスト名", with: "テスト用プレイリスト"
    fill_in "説明", with: "RSpecテスト"

    click_button "作成"

    expect(page).to have_content("テスト用プレイリスト")
  end
end
