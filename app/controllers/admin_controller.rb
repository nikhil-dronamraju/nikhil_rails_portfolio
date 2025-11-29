class AdminController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: auth_params[:email])
    if user
      user.authenticate(password: auth_params[:password])
      # Navigate them to index, and invalidate the user otherwise. Also, add a before_hook to ensure authentication
    else
      pp "Invalid user"
    end
  end

  private

  def auth_params
    params.expect(user: [ :email, :password ])
  end
end
