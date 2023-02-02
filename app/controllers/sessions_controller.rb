class SessionsController < ApplicationController
  def index; end

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(homes_path, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: :new, status: :unprocessable_entity
    end
  end

  def destroy
    if logout
      redirect_to(root_path, notice: 'Logged out!')
    else
      flash.now[:error] = 'Error'
    end
  end
end
