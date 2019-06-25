FactoryBot.define do
  factory :transaction do
    account 
    action { 'credit' }
  end
end
