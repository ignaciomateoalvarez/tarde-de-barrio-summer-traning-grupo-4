class UserPolicy < ApplicationPolicy
  attr_reader :user, :record
  
  def initialize(user, record)
   @user = user
   @record = record
  end
  
  def update?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
  
  def edit?
    update?
  end
end