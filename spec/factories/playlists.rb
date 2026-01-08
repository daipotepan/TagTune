FactoryBot.define do
  factory :playlist do
    name { "My Playlist" }
    association :user
  end
end