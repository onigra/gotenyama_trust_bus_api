class BusController < ApplicationController
  def show
    bus = Bus.new(params["from_place"])

    if bus.valid?
      render json: { response: bus.next_bus }, status: 200
    else
      render json: { response: bus.errors }, status: 404
    end
  end
end
