FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.word.upcase }
  end
end
