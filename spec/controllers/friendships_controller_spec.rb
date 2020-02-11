require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(email: 'test-1@test.com', password: 'password', password_confirmation: 'password')
  end

  let!(:second_user) do
    User.create(email: 'test-2@test.com', password: 'password', password_confirmation: 'password')
  end

  context 'logged in user' do
    before { sign_in user }

    context 'when no friend' do
      it 'initiates new friendship' do
        Friendship.create(friend: user, user: second_user)
        check_friendship = user.friend?(second_user)
        expect(check_friendship).to be_falsy
      end
    end
  end

  context 'the other user' do
    before { sign_in second_user }

    it 'no friendship created' do
      expect do
        post :create, params: { friendship: { user_id: user.id, friend_id: second_user.id } }
      end.not_to change(user.friendships, :count)
    end
  end
end
