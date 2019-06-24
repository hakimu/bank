require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#create' do
    context 'when given a invalid attributes' do
      context 'with an invalid account number' do
        it 'does not create an account' do
          account = build(:account, number: 123)
          account.save
          expect(account.errors.full_messages).to include('Number is the wrong length (should be 10 characters)')
        end
      end
      context 'without a valid user' do
        it 'does not create an account' do
          account = build(:account, user_id: nil)
          account.save
          expect(account.errors.full_messages).to include('User must exist')
        end
      end
      context 'when passed an invalid description' do
        it 'does not create an account' do
          account = build(:account, description: '401k')
          account.save
          expect(account.errors.full_messages).to include('Description is not included in the list')
        end
      end
    end
    context 'by default the account balance is $0' do
      it 'has an account balance of $0 by default' do
        account = create(:account)
        expect(account.balance).to eq(0)
      end
    end
  end 
  describe 'associating transactions with accounts' do
    context 'when given valid transactions' do
      it 'associates transactions with accounts' do
        user = create(:user)
        account = create(:account, user_id: user.id)
        create(:transaction, account_id: account.id)
        create(:transaction, account_id: account.id)
        create(:transaction, account_id: account.id)
        expect(account.transactions.count).to eq(3)
      end
    end
  end
end
