# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'StudentController', type: :request do

  before(:each) do
    @user = build(:user)
    login_user
  end

  describe 'GET index' do
    # LOGUEAR UN USUARIO ANTES DE TESTEAR PARA QUE FUNCIONE BIEN
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
    before { get edit_student_path }

    context 'when request is valid' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:edit) }
    end
  end
end
