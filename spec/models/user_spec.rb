# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lastname) }
  end

  describe 'Uniqueness validations' do
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'Email Format' do
    it { is_expected.to allow_value('name@doman.com').for(:email) }
    it { is_expected.to_not allow_value('namedoman.com').for(:email) }
    it { is_expected.to_not allow_value('name@domancom').for(:email) }
  end
end
