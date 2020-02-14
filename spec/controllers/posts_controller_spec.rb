require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    @user = User.create(email: 'user@mail.com', password: 'foobar')
  end

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

  describe 'Create new post' do
    it 'creates a valid post' do
      @post = @user.posts.build(title: 'title post', content: 'A new post')
      expect(@post).to be_valid
    end
  end

  it 'creates a blank post' do
    @post = @user.posts.build(content: ' ')
    expect(@post.valid?).to eql(false)
  end
end
