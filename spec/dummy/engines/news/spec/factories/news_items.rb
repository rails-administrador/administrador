FactoryBot.define do
  factory :news_item, class: 'News::Item' do
    sequence(:title) { |i| "News Item #{i}" }
    body { "Lorem Ipsum" }
    association(:category, factory: :news_category)
  end
end
