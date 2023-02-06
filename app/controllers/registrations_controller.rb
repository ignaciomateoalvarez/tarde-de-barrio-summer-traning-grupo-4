class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:name, :lastname, :email, :password, :password_confirmation)
  end

end
