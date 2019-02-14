FactoryBot.define do
  factory :news_category, class: 'News::Category' do
    sequence(:identifier) { |i| "news_category_#{i}" }
  end
end
