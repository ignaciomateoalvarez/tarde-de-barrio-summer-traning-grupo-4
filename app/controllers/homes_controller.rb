# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    unless current_user
      redirect_to new_session_path
    end
  end
end
