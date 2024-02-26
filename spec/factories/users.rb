FactoryBot.define do
  factory :user, class: 'User' do
    name { "Test User" }
    email { "test@example.com" }
    phone_number { "1234567890"}
    password { "password" }
    admin { false }
  end
end
