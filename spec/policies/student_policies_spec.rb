# frozen_string_literal: true
require 'pundit/rspec'
require 'rails_helper'

RSpec.describe StudentPolicy do
  include Pundit::Matchers

  subject { described_class }

  let(:admin) { FactoryBot.create(:user, role: 'admin') }
  let(:user) { FactoryBot.create(:user) }
  let(:student) { FactoryBot.create(:student, user: user) }

  permissions :update? do
    context 'when user is an admin' do
      it 'grants access' do
        expect(subject).to permit(admin)
      end
    end

    context 'when user is the owner of the record' do
      it 'grants access' do
        expect(subject).to permit(user, student)
      end
    end

    context 'when user is not an admin or the owner of the record' do
      it 'denies access' do
        expect(subject).not_to permit(FactoryBot.create(:user), student)
      end
    end
  end
end
