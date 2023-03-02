# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubComment, type: :model do
  describe 'validation' do
    it { should belong_to(:comment) }
    it { should belong_to(:user) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
