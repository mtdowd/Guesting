class ShiftMembershipsController < ApplicationController
  def create
    @shift = find_shift
    @shift.add_bartender(current_user)

    redirect_to @shift
  end

  def destroy
    @shift = find_shift
    @shift.remove_bartender(current_user)

    redirect_to @shift
  end

  private

  def find_shift
    Shift.find(params[:id])
  end
end
