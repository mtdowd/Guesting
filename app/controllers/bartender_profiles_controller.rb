class BartenderProfilesController < ApplicationController
  def new
    @bartender_profile = BartenderProfile.new
  end

  def create
    @bartender_profile = BartenderProfile.new(profile_params)

    if @bartender_profile.save
      current_user.update(profile: @bartender_profile)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:bartender_profile).
      permit(:facebook, :name, :phone, :twitter).
      merge(email: current_user.email)
  end
end
