class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :manager)
  end

  def profile_path(current_user)
    if current_user.manager?
      new_manager_profile_path
    else
      new_bartender_profile_path
    end
  end
end
