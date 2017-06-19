class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
  @appearance = Appearance.new(appearance_params)
    if @appearance.valid?
      @appearance.save
      redirect_to appearance_path(@appearance)
    else
      render :new
    end
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    if @appearance.update(appearance_params)
      redirect_to appearance_path(@appearance)
    else
      render :edit
    end
  end


  def delete
  end


  private
  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end
end
