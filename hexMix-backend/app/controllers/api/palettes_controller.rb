class Api::PalettesController < ApplicationController
  before_filter :set_default_response_format 

  def index
    @palettes = Palette.all
    render json: @palettes 
    end
  end

  def show
    @palette = get_palette
    render json: @palette 
    end
  end

  def create
    @palette = Palette.new(palette_params)
      if @palette.save
        render json: @palette, status: 201 
      else
        render json: @palette.errors, status: 422 
      end
    end
  end

  def update
    @palette = get_palette
      if @palette.update_attributes(palette_params)
        render json: @palette, status: 201 
      else
        render json: @palette.errors, status: 422 
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