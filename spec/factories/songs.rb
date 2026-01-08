FactoryBot.define do
  factory :song do
    title { "夜に駆ける" }
    artist { "YOASOBI" }
    spotify_url { "https://open.spotify.com/track/test" }
    association :user
  end
end
