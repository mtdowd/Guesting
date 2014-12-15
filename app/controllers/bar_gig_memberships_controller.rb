class BarGigMembershipsController < ApplicationController
  def create
    @bar = find_bar
    @bar.add_member(current_user)

    redirect_to @bar
  end

  def destroy
    @bar = find_bar
    @bar.remove_member(current_user)

    redirect_to root_path
  end

  private

  def find_bar
    Bar.find(params[:id])
  end
end
