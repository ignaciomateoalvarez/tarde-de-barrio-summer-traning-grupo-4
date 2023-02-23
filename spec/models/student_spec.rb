# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:school_grade) }
    it 'Validates if is active or not' do
      student = build(:student, active_student: nil)
      expect(:active_student).to_not be_in([true, false])
    end
    it { should define_enum_for(:school_grade).with_values([:Inicial, :Primaria, :Secundaria]) }
    it "Doesn't allow future dates" do
      student = build(:student, birthdate: Date.tomorrow)
      expect(student).to_not be_valid
      expect(student.errors[:birthdate]).to include("No se puede ingresar una fecha futura")
    end
  end
  describe 'Format' do
    it { is_expected.to allow_value('Julián').for(:name) }
    it { is_expected.not_to allow_value('Julian777*').for(:name) }
    it { is_expected.to allow_value('Alvarez').for(:lastname) }
    it { is_expected.not_to allow_value('Alvarez777*').for(:lastname) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Remove Students' do
    let(:student) { FactoryBot.create(:student) }
    it 'deletes student' do
      expect do
        delete :destroy, id => student.id
        flash[:notice].should =~ 'El estudiante a sido eliminado correctamente'
      end
    end
  end
end
