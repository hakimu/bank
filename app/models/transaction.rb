class Transaction < ApplicationRecord
  belongs_to :account
  validates :account, presence: true
  validates :action, presence: true, inclusion: { in: %w(credit debit) }

  def deposit(amount)
    self.account.balance += amount
  end
end
