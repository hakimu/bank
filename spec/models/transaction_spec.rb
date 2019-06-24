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
  end
end
