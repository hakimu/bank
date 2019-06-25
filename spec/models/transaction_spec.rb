require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#create' do
    context 'when given invalid attributes' do
      it 'does not create when there\'s no action' do
        transaction = build(:transaction, action: nil)
        transaction.save
        expect(transaction.errors.full_messages).to include('Action can\'t be blank')
      end
      it 'does not create when the action is wrong' do
        transaction = build(:transaction, action: 'foo')
        transaction.save
        expect(transaction.errors.full_messages).to include('Action is not included in the list')
      end
      it 'does not create when there is no account' do
        transaction = build(:transaction, account_id: nil)
        transaction.save
        expect(transaction.errors.full_messages).to include('Account can\'t be blank')
      end
    end
    context 'when given valid attributes' do
      it 'creates a valid transaction' do
        transaction = build(:transaction)
        expect { transaction.save }.to change { Transaction.count }.by(1)
      end
    end
  end
  describe '#credit' do
	  let(:account) { create(:account) }
	  let(:transaction) { create(:transaction, account_id: account.id) }
    it 'can properly deposit/credit one transaction for an acccount' do
      transaction.credit(500)
      expect(transaction.account.balance.to_f).to eq(500.0)
    end
    it 'can properly handle multiple transactions' do
      transaction.credit(500)
      transaction.credit(500)
      expect(transaction.account.balance.to_f).to eq(1000.0)
    end
  end
  describe '#debit' do
	  let(:account) { create(:account) }
	  let(:transaction) { create(:transaction, account_id: account.id) }
    it 'can properly withdrawl/debit one transaction for an account' do
      transaction.debit(500)
      expect(transaction.account.balance.to_f).to eq(-500.0)
    end
    it 'can properly handle multiple transactions' do
      transaction.debit(500)
      transaction.debit(500)
      expect(transaction.account.balance.to_f).to eq(-1000.0)
    end
  end
end
