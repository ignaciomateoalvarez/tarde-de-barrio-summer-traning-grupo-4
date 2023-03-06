# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to(:comment) }
  it { should belong_to(:user) }

  describe 'Create like' do
    let!(:user) { create(:user) }
    let!(:student) { create(:student) }
    let!(:comment) { Comment.create(body: 'Comentario', user_id: user.id, student_id: student.id) }
    let!(:like) { Like.create(user_id: user.id, comment_id: comment.id) }

    it 'create like for comment with user' do
      expect(like.user).to eql(user)
      expect(like.comment).to eql(comment)
    end
    it 'should persist like' do
      expect(like.persisted?).to be_truthy
    end
  end
end
