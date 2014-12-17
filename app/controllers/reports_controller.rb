class ReportsController < ApplicationController
  def show
    @report = Report.new(bar)
  end

  private

  def bar
    @bar ||= Bar.find(params[:id])
  end
end
