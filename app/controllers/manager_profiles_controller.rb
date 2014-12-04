class ManagerProfilesController < ApplicationController
  def new
    @manager_profile = ManagerProfile.new
  end

  def create
    @manager_profile = ManagerProfile.new(profile_params)

    if @manager_profile.save
      current_user.update(profile: @manager_profile)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:manager_profile).
      permit(:name, :phone).
      merge(email: current_user.email)
  end
end
