class BartenderReport
  attr_reader :bar, :bartender

  delegate :name, to: :bartender

  def initialize(bar, bartender)
    @bar = bar
    @bartender = bartender
  end

  def average_sales_per_shift
    if shift_count > 0
      total_sales / worked_shifts.count
    else
      "0 - No shifts worked"
    end
  end

  def total_sales
    worked_shifts.reduce(0) { |total, shift| total + shift.sales }
  end

  def shift_count
    worked_shifts.count
  end

  def worked_shifts
    @bartender.shifts.includes(:shift_metric).
      where(bar: @bar).
      where.not(shift_metrics: { id: nil })
  end
end
