class DosesController < ApplicationController
  before_action :set_smoothie, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.smoothie = @smoothie
    if @dose.save
      redirect_to smoothie_path(@smoothie)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to smoothies_path
  end

  private

  def set_smoothie
    @smoothie = Smoothie.find(params[:smoothie_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :smoothie_id, :ingredient_id)
  end
end
