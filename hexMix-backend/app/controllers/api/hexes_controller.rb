class Api::HexesController < ApplicationController
  def index
    @hex = Hex.all
    render json: @hex
  end
end 