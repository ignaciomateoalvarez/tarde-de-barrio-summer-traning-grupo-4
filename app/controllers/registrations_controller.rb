# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.create(user_params)
    if @user.save
      login(user_params[:email], user_params[:password])
      redirect_to homes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:name, :lastname, :email, :password, :password_confirmation)
  end
end
