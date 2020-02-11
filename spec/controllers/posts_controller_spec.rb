require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    it 'has a 302 status code' do
      get :index
      expect(response.status).to eq(302)
    end
  end

  describe 'GET create' do
    it 'has a 302 status code' do
      get :create
      expect(response.status).to eq(302)
    end
  end

  describe 'GET new' do
    it 'has a 302 status code' do
      get :new
      expect(response.status).to eq(302)
    end
  end
end
