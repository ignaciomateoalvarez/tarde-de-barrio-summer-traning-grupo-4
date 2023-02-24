# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StudentController', type: :request do
  before(:each) do
    @user = build(:user)
    login_user
  end

  describe 'GET index' do
    before { get students_path }
    context 'when request is valid' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:index) }
    end
  end

  describe 'GET show' do
    let!(:student) { create(:student) }
    before { get student_path(student) }
    context 'when request is valid' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:show) }
    end
  end

  describe 'GET new' do
    before { get new_student_path }

    context 'when request is valid' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:new) }
    end
  end

  describe 'GET edit' do
    let!(:student) { create(:student) }
    before { get edit_student_path(student) }
    context 'when request is valid' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe 'Create student' do
    let!(:user) { login_user }
    let!(:student) { build(:student) }
    before { post students_path student: student.attributes }
    context 'When user is logged' do
      it 'returns http success' do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(students_path)
      end
    end
  end

  describe 'Update student' do
    let!(:student) { create(:student) }
    it 'update student attributes' do
      put student_path(student.id), params: { student: student.attributes }
      student.reload
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(students_path)
    end
  end

  describe 'Create comment' do
    let!(:student) { create(:student) }
    let!(:user) { create(:user) }
    let!(:comment) { Comment.create(body: 'Comentario', user_id: user.id, student_id: student.id) }

    it 'create comment for student with user' do
      expect(comment.user).to eql(user)
      expect(comment.student).to eql(student)
    end
    it 'should persist comment' do
      expect(comment.persisted?).to be_truthy
    end
  end
end
