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
        new_user = build(:user, username: 'hakimu', email: 'hakimu@example.com', password: 'password')
        new_user.save
        expect(new_user.errors.full_messages).to include('Username has already been taken')
      end
    end
  end
end
