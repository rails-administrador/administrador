FactoryBot.define do
  factory :blorgh_post, class: 'Blorgh::Post' do
    sequence(:title) { |n| "Blorgh Post #{n}" }
    sequence(:body) { |n| "This is the body of blorgh post #{n}" }
    published_at { Time.current }
  end
end

