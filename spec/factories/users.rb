FactoryBot.define do
  factory :user do
    email { "test#{SecureRandom.hex(4)}@example.com" }
    password { "password" }
  end
end