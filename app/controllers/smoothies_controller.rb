class SmoothiesController < ApplicationController
  before_action :find_smoothie, only: [:show, :destroy]

  def index
    @smoothies = Smoothie.all
    @search = params["search"]
    if @search.present?
      @name = @search["query"]
      @smoothies = Smoothie.where("name ILIKE ?", "%#{@name}%")
    end
  end

  def show; end

  def new
    @smoothie = Smoothie.new
  end

  def create
    @smoothie = Smoothie.new(smoothie_params)
    if @smoothie.save
      redirect_to smoothie_path(@smoothie)
    else
      render :new
    end
  end

  def destroy
    @smoothie.destroy
  end

  private

  def find_smoothie
    @smoothie = Smoothie.find(params[:id])
  end

  def smoothie_params
    params.require(:smoothie).permit(:name, :img_url)
  end
end
