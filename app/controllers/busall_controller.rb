class BusallController < ApplicationController
  def show
    bus = Busall.new(params["from_place"])

    if bus.valid?
      render json: { response: bus.timetable }, status: 200
    else
      render json: { response: bus.errors }, status: 404
    end
  end
end
