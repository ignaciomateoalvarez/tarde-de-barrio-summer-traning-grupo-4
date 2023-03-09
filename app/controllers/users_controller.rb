# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy toggle_active]
  before_action :ensure_frame_response, only: %i[new edit]
  before_action :require_login

  # GET /users or /users.json
  def index
    @filter = UserFilter.new(User.all.order(created_at: :desc), filter_params)
    @pagy, @users = pagy(@filter.call)
  end

  # GET /users/new
  def new
    authorize current_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize current_user
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    authorize current_user
    @user = User.create(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    authorize current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def toggle_active
    authorize current_user
    @user.toggle(:is_active)
    @user.save
    redirect_to users_path
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    authorize current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation, :role)
  end

  def filter_params
    params.fetch(:user_filter, {}).permit(
      :query
    )
  end

  def ensure_frame_response
    return unless Rails.env.development?

    redirect_to root_path unless turbo_frame_request?
  end

  def not_authenticated
    redirect_to new_session_path, error: t('.not_authenticated')
  end
end
