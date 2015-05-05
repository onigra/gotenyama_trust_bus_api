class Busall
  include ActiveModel::Model
  include DateType

  PLACE_LIST = ["shinagawa", "gotenyama"]

  validates :from_place, inclusion: { in: PLACE_LIST, message: "Invalid place. Valid place is gorenyama or shinagawa." }

  attr_accessor :from_place

  def initialize(from_place)
    @current_datetime = DateTime.now
    @from_place = from_place
  end

  def timetable
    @timetable ||= "Timetables::From#{@from_place.capitalize}".constantize.send(date_type)
  end
end
