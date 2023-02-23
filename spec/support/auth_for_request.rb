# frozen_string_literal: true

module AuthForRequest
  def login_user(user = nil)
    user ||= create(:user, role: 'admin', is_active: true)
    username = user.email
    user.update password: 'secret', password_confirmation: 'secret'
    send(:post, sessions_url, params: { email: username, password: 'secret' })
  end

  def logout_user
    SessionsController.send(:destroy)
  end
end
