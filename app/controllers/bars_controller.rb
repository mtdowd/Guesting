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
    bar
  end

  def edit
    bar
  end

  def update
    bar.update(bar_params)

    if @bar.save
      redirect_to @bar
    else
      render :edit
    end
  end

  def destroy
    bar.destroy

    redirect_to bars_path
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

  def bar
    @bar ||= Bar.find(params[:id])
  end
end
