require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before :each do
    @user = User.create(email: 'user@mail.com', password: 'foobar')
    @post = @user.posts.build(title: 'title post', content: 'This is a post')
    @post.save
  end

  describe 'GET likes#create' do
    it 'should perform a like' do
      @like = @user.likes.build(post_id: @post.id)
      expect(@like.valid?).to eql(true)
    end

    it 'perform an invalid like without post id' do
      @like = @user.likes.build
      expect(@like.valid?).to eql(false)
    end
  end
end
