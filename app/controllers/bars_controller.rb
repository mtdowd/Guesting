class BarsController < ApplicationController
  def index
    @bars = Bar.all
    @bar = Bar.new
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)

    if @bar.save
      redirect_to @bar
    else
      render :new
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private

  def bar_params
    params.require(:bar).permit(
      :address,
      :city,
      :name,
      :phone,
      :state,
      :website,
      :zip
    )
  end
end
