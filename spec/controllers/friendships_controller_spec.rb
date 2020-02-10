require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(email: 'test-1@test.com', password: 'password', password_confirmation: 'password')
  end

  let!(:second_user) do
    User.create(email: 'test-2@test.com', password: 'password', password_confirmation: 'password')
  end

  describe 'actions with friendships' do
    it 'sending and cancelling a request for friendship' do
      sign_in user
    end
  end
end
