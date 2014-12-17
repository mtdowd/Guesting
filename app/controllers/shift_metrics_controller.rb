class ShiftMetricsController < ApplicationController
  def new
    @shift_metric = ShiftMetric.new
  end

  def create
    @shift_metric = ShiftMetric.new(metric_params)

    if @shift_metric.save
      redirect_to shift_shift_metric_path
    else
      render :new
    end
  end

  def show
    find_shift
  end

  def edit
    find_shift_metric
  end

  def update
    if find_shift_metric.update(metric_params)
      redirect_to shift_shift_metric_path
    else
      render :edit
    end
  end

  private

  def metric_params
    params.require(:shift_metric).permit(
      :patron_count,
      :sales
    ).merge(shift_id: shift_id)
  end

  def find_shift
    @shift ||= Shift.find(params[:shift_id])
  end

  def shift_id
    params[:shift_id]
  end

  def find_shift_metric
    @shift_metric ||= ShiftMetric.find_by(shift_id: shift_id)
  end
end
