# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:student) }
  it { should belong_to(:user) }
  it { is_expected.to validate_presence_of(:body) }
end