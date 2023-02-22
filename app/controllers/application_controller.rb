# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:error] = "No tienes permisos suficientes para realizar esta acción."
    redirect_to(request.referrer || root_path)
  end
end
