require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(first_name: 'First Name', last_name: 'Last Name',
                        email: 'exaple@email.com', password: 'password')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a first name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
