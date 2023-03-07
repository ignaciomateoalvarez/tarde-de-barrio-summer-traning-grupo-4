# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @students = Student.all
  end
end
