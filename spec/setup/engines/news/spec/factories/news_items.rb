FactoryBot.define do
  factory :news_item, class: 'News::Item' do
    sequence(:title) { |n| "News Item #{n}" }
    sequence(:body) { |n| "This is the body of news item #{n}" }
    published_at { Time.current }
    association :category, factory: :news_category
  end

  factory :news_category, class: 'News::Category' do
    sequence(:identifier) { |n| "category_#{n}" }
  end
end

