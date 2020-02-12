require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  let(:attributes) do
    {
      user: { email: 'mike@example.com', password: 'foobar', password_confirmation: 'foobar' }
    }
  end

  let(:empty_attributes) do
    {
      user: { email: '', password: '', password_confirmation: '' }
    }
  end

  describe 'GET sign up' do
    it 'Return success' do
      get '/users/sign_up'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Sign Up' do
    context 'Attributes to be valid' do
      it 'Creates New User' do
        post '/users', params: attributes
        user = User.find_by(email: attributes[:user][:email])
        expect(user).not_to be_nil
      end

      it 'redirects to root' do
        post '/users', params: attributes
        expect(response).to redirect_to('/')
      end
    end

    context 'Missing attributes' do
      it 'raise error messages' do
        post '/users', params: empty_attributes
        expect(response.body).to include CGI.escapeHTML("Email can't be blank")
        expect(response.body).to include CGI.escapeHTML("Password can't be blank")
      end

      it 'Does not create user' do
        post '/users', params: empty_attributes
        user = User.find_by(email: attributes[:user][:email])
        expect(user).to be_nil
      end
    end
  end
end
