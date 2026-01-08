class User < ApplicationRecord
  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :playlists, dependent: :destroy
  has_many :songs, through: :playlists

  # =========================
  # ゲストユーザー関連
  # =========================

  GUEST_EMAIL = "guest@example.com"

  # ゲストユーザー取得 or 作成
  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  # ゲストかどうか判定
  def guest?
    email == GUEST_EMAIL
  end
end