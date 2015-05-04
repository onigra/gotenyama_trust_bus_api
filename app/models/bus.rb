class Bus
  include ActiveModel::Model
  include DateType

  PLACE_LIST = ["shinagawa", "gotenyama"]

  validates :from_place, inclusion: { in: PLACE_LIST, message: "Place is not found." }

  attr_accessor :from_place

  def initialize(from_place)
    @current_datetime = DateTime.now
    @from_place = from_place
  end

  def most_recent
    most_recent_bus_time
  rescue BusIsOverError
    "Bus is over."
  end

  #
  # if 現在時の時刻表が無い
  #   バスはもう無い
  # else
  #   if 現在時の最後のバスが無い
  #     if 次の時刻の時刻表が無い
  #       バスはもう無い
  #     else
  #       次の時刻の直近の時間を返す
  #     end
  #   else
  #     現在時で直近の時間を返す
  #   end
  # end
  #
  def most_recent_bus_time
    if current_hour_timetable.nil?
      raise BusIsOverError
    else
      if current_hour_recent.nil?
        if next_hour_timetable.nil?
          raise BusIsOverError
        else
          "#{current_hour + 1}:#{next_hour_timetable.first}"
        end
      else
        "#{current_hour}:#{current_hour_recent}"
      end
    end
  end

  private

  def timetable
    "Timetables::From#{@from_place.capitalize}".constantize.send(date_type)
  end

  def current_hour
    @current_datetime.hour
  end

  def current_hour_timetable
    timetable[@current_datetime.hour.to_s]
  end

  def next_hour_timetable
    timetable[(@current_datetime.hour + 1).to_s]
  end

  def current_hour_recent
    current_hour_timetable.select { |i| i > @current_datetime.minute }.first
  end
end
