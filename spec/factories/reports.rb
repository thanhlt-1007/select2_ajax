FactoryBot.define do
  factory :report do
    category
    title { FFaker::LoremJA.sentence }
  end
end
