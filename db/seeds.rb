10.times do
  category = FactoryBot.create :category
  FactoryBot.create_list :article, 10, category: category
  FactoryBot.create_list :report, 10, category: category
end
