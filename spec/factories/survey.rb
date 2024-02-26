FactoryBot.define do
  factory :survey, class: 'Survey' do
    title { "イチゴの育苗方法" }
    is_useful { true }
    is_request { false }
  end
end
