# 🎧 TagTune

TagTune は **Spotify URL × タグ × プレイリスト管理** を軸にした、
「自分の音楽を整理・再発見する」ための個人向け音楽管理アプリです。

Rails を用いた MVC 設計・認証・中間テーブル設計・UI/UX 改善を重視して構築されています。

---

## 📌 主な機能

### ✅ ユーザー認証（Devise）

* 新規登録 / ログイン / ログアウト
* ログインユーザーごとのデータ管理

### 🎵 曲管理（Songs）

* 曲名 / アーティスト名 / Spotify URL を登録
* 複数タグを付与可能
* 登録曲はログインユーザーごとに管理

### 🏷 タグ管理（Tags）

* 曲に複数タグを付与（気分・ジャンルなど）
* `songs_tags` 中間テーブルによる多対多設計

### 🎧 プレイリスト管理（Playlists）

* プレイリスト作成 / 編集 / 削除
* プレイリスト詳細ページ
* ユーザー単位でのプレイリスト管理

### 🎨 UI / UX 改善

* 共通ボタンデザイン（primary / outline）
* index / form の責務分離
* 余白・カードレイアウトの統一

---

## 🧱 技術スタック

| 項目      | 内容                |
| ------- | ----------------- |
| 言語      | Ruby 3.x          |
| フレームワーク | Ruby on Rails 8.x |
| DB      | SQLite3           |
| 認証      | Devise            |
| フロント    | ERB / CSS         |
| JS      | Turbo / Hotwire   |

---

## 🗂 データベース設計

### ER 図（概要）

```
users
  ├─ has_many :songs
  ├─ has_many :playlists

songs
  ├─ belongs_to :user
  ├─ has_many :song_tags
  ├─ has_many :tags, through: :song_tags

playlists
  ├─ belongs_to :user

song_tags
  ├─ belongs_to :song
  ├─ belongs_to :tag

tags
  ├─ has_many :song_tags
  ├─ has_many :songs, through: :song_tags
```

---

## 🧩 各モデルの役割

### User

* Devise による認証管理
* 曲・プレイリストの所有者

### Song

* 曲情報を管理
* Spotify URL を保存
* タグとの多対多関係

### Tag

* 曲を分類するためのラベル
* 気分・ジャンル・用途想定

### Playlist

* ユーザーが作成する曲の集合（今後拡張予定）

---

## 🖥 画面構成

| 画面       | 内容           |
| -------- | ------------ |
| トップ      | ログイン誘導       |
| 曲一覧      | 登録した曲を一覧表示   |
| 曲追加      | 曲情報 + タグ選択   |
| プレイリスト一覧 | 作成済みプレイリスト表示 |
| プレイリスト作成 | 新規作成フォーム     |

---

## 📁 ディレクトリ構成（抜粋）

```
app/
 ├─ controllers/
 │   ├─ songs_controller.rb
 │   ├─ playlists_controller.rb
 │   └─ users_controller.rb

 ├─ models/
 │   ├─ user.rb
 │   ├─ song.rb
 │   ├─ tag.rb
 │   ├─ playlist.rb
 │   └─ song_tag.rb

 ├─ views/
 │   ├─ songs/
 │   │   ├─ index.html.erb
 │   │   ├─ new.html.erb
 │   │   └─ _form.html.erb
 │   └─ playlists/
 │       ├─ index.html.erb
 │       ├─ new.html.erb
 │       ├─ edit.html.erb
 │       └─ _form.html.erb
```

---

## 🎯 設計上のポイント

### partial（_form）の責務分離

* 見出しは `new / edit` に記述
* `_form` はフォーム専用

### current_user スコープ

* 他人のデータにアクセス不可

```ruby
@songs = current_user.songs
```

### Turbo Method 利用

```erb
<%= link_to "削除", playlist_path(playlist),
  data: { turbo_method: :delete, turbo_confirm: "削除しますか？" } %>
```

---

## 🚀 今後の拡張予定

* プレイリスト × 曲の紐付け機能
* Spotify API 連携（曲情報自動取得）
* タグ検索 / フィルタ
* おすすめプレイリスト生成
* ダークモード

---

## 🛠 セットアップ手順

```bash
git clone https://github.com/yourname/tagtune.git
cd tagtune
bundle install
rails db:create db:migrate
rails s
```

---

## 👤 作者

* 名前：sato daisuke
* 学習目的：Rails ポートフォリオ制作
* 重点：設計理解 / UX / 可読性

---

🎧 **TagTune — 音楽を、タグで整える。**
# TagTune
