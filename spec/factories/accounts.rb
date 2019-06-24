FactoryBot.define do
  factory :account do
    user
    number { 1234567890 }
    description { 'checking' }
  end
end
