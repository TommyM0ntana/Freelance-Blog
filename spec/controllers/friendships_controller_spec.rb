require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  fixtures :users

  describe 'GET #create' do
    it 'returns http success' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in users(:one)
      current_user = users(:one)
      user1 = users(:two)
      current_user.friendships.build(friend_id: user1.id)
      expect(response).to have_http_status(200)
    end
  end
end
