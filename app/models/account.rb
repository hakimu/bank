class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :number, presence: true, length: { is: 10 }
  validates :description, presence: true, inclusion: { in: %w(checking savings money_market CD IRA) }
end
