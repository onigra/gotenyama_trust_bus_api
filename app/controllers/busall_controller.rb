class BusallController < ApplicationController
  def show
    bus = Busall.new(params["from_place"])

    if bus.valid?
      render json: bus.timetable, status: 200
    else
      render json: { message: bus.errors }, status: 404
    end
  end
end
