class BusController < ApplicationController
  def show
    bus = Bus.new(params["from_place"])

    if bus.valid?
      render json: { next: bus.most_recent }, status: 200
    else
      render json: { message: bus.errors }, status: 404
    end
  end
end
