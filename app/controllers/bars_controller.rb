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
    if current_user.owns?(@bar)
      bar
    else
      redirect_to @bar
    end
  end

  def update
    bar
    if current_user.owns?(@bar)
      bar.update(bar_params)
    end

    if @bar.save
      redirect_to @bar
    else
      render :edit
    end
  end

  def destroy
    bar
    if current_user.owns?(@bar)
      bar.destroy
    end

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
    ).merge(user: current_user)
  end

  def bar
    @bar ||= Bar.find(params[:id])
  end
end
