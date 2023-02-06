FactoryBot.define do
  factory :article do
    category
    title { FFaker::LoremJA.sentence }
  end
end
