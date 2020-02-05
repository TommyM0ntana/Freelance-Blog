require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(title: 'Title', content: 'Lorem ipsum')
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end
