# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    create?
  end

  def create?
    user.is_active?
  end

  def edit?
    update?
  end

  def update?
    user.admin?
  end

  def toggle_active?
    user.admin?
  end
end
