class StudentsController < ApplicationController
  def index
    @presenter = StudentsPresenter.new(params:params)
  end
end
