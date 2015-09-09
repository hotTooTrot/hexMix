class Api::PalettesController < ApplicationController

  def index
    @palettes = Palette.all
    respond_to do |format|
      format.json { render json: @palettes }
    end
  end

  def show
    @palette = get_palette
    respond_to do |format|
      format.json { render json: @palette }
    end
  end

  def create
    @palette = Palette.new(palette_params)
    respond_to do |format|
      if @palette.save
        format.json { render json: @palette, status: 201 }
      else
        format.json { render json: @palette.errors, status: 422 }
      end
    end
  end

  def update
    @palette = get_palette
    respond_to do |format|
      if @palette.update_attributes(palette_params)
        format.json { render json: @palette, status: 201 }
      else
        format.json { render json: @palette.errors, status: 422 }
      end
    end
  end

  def destroy
    @palette = get_palette
    @palette.destroy
      render json: @palette, status: 422 
  end

  private

  def palette_params
    params.require(:palette).permit(:title, :keyword)
  end

  def get_palette
    Palette.find(params[:id])
  end
end