require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'when given invalid attributes' do
      it 'does not create a user without a username' do
        user = build(:user, username: nil)
        user.save
        expect(user.errors.full_messages).to include('Username can\'t be blank')
      end
      it 'does not create a user when there\'s an existing username' do
        create(:user)
        new_user = build(:user, username: 'hakimu', email: 'hakimu@example.com') 
        new_user.save
        expect(new_user.errors.full_messages).to include('Username has already been taken')
      end
      it 'does not create a user without an email' do
        user = build(:user, email: nil)
        user.save
        expect(user.errors.full_messages).to include('Email can\'t be blank')
      end
      it 'does not create a user when there\'s an existing email' do
        create(:user)
        new_user = build(:user, username: 'kimu', email: 'h@example.com')
        new_user.save
        expect(new_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'does not create a user when there\'s not a password' do
        user = build(:user, password: nil)
        user.save
        expect(user.errors.full_messages).to include('Password can\'t be blank')
      end
    end
  end
  describe 'A user can have multiple accounts' do
    it 'associates accounts with a user' do
      user = create(:user)
      create(:account, user_id: user.id)
      create(:account, user_id: user.id)
      expect(user.accounts.count).to eq(2)
    end
  end
end
