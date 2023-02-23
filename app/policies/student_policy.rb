# frozen_string_literal: true

class StudentPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    create?
  end

  def index?
    user.present? && user.is_active?
  end

  def create?
    user.is_active?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || (record.user == user)
  end

  def toggle_active
    user.admin?
  end

  def delete?
    destroy?
  end

  def destroy?
    user.admin?
  end
end
