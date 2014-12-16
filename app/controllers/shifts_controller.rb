class ShiftsController < ApplicationController
  before_action :require_bar_owner, only: [:new, :create]
  before_action :require_owner, only: [:edit, :update, :destroy]
  before_action :require_membership, only: [:show]

  def index
    find_bar
    @shifts = @bar.shifts
  end

  def new
    @shift = Shift.new(bar_id: bar_id)
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to [@shift.bar, @shift]
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to [@shift.bar, @shift]
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy

    redirect_to bar_shifts_path(@shift.bar)
  end

  private

  def require_bar_owner
    find_bar
    unless current_user.owns?(@bar)
      redirect_to @bar
    end
  end

  def require_owner
    find_shift
    unless current_user.owns?(@shift.bar)
      redirect_to [@shift.bar, @shift]
    end
  end

  def require_membership
    find_shift
    unless current_user.owns_or_works_at?(@shift.bar)
      redirect_to @shift.bar
    end
  end

  def find_bar
    @bar ||=
      current_user.owned_bars.find_by(id: bar_id) ||
      current_user.bars.find_by(id: bar_id)
  end

  def bar_id
    params[:bar_id]
  end

  def find_shift
    @shift ||= Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(
      :bartender_count,
      :details,
      :shift_date,
      :shift_start
    ).merge(bar_id: bar_id)
  end
end
