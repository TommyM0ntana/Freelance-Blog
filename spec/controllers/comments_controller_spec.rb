require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before :each do
    @user = User.create(email: 'test@test.com', password: 'foobar')
    @post = @user.posts.build(title: 'title', content: 'This is a post')
    @post.save
  end

  describe 'should create comment' do
    it 'comment should be valid comment' do
      @comment = @post.comments.create(content: 'this is a valid comment', user_id: @user.id)
      expect(@comment).to be_valid
    end

    it 'blank comment should produce an error' do
      @comment = @post.comments.create(content: ' ', user_id: @user.id)
      expect(@comment.valid?).to eql(false)
    end
  end
end
