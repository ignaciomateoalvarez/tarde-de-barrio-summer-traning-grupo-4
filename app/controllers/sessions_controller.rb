# frozen_string_literal: true

class SessionsController < ApplicationController
  def index; end

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.is_active?
        if login(params[:email], params[:password])
          redirect_back_or_to(homes_path, notice: t('login_success'))
        else
          flash.now[:alert] = t('login_failed')
          render action: :new, status: :unprocessable_entity
        end
      else
        redirect_to root_path, alert: t('user_disabled')
      end
    else
      redirect_to root_path, alert: t('not_found')
    end
  end

  def destroy
    if logout
      redirect_to(root_path, notice: t('cerro_sesion'))
    else
      flash.now[:error] = t('error')
    end
  end
end
