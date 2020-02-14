require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_db_column(:title) }
  it { is_expected.to have_db_column(:content) }
  it { is_expected.to have_db_column(:user_id) }
end
