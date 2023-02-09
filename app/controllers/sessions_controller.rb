class SessionsController < ApplicationController
  def index; end

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.is_active?
        if login(params[:email], params[:password])
          redirect_back_or_to(homes_path, notice: 'Login successful')
        else
          flash.now[:alert] = 'Login failed'
          render action: :new, status: :unprocessable_entity
        end
      else
        redirect_to root_path, alert: 'User is disabled'
      end
    else
      redirect_to root_path, alert: 'User not found'
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
