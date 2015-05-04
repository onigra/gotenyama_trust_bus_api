class Bus < Busall

  def next_bus
    next_bus_time
  rescue BusIsOverError
    "Bus is over."
  end

  private

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
  def next_bus_time
    if current_hour_timetable.nil?
      raise BusIsOverError
    else
      if current_hour_recent.nil?
        if next_hour_timetable.nil?
          raise BusIsOverError
        else
          next_hour_bus
        end
      else
        current_hour_bus
      end
    end
  end

  def current_hour
    @current_datetime.hour
  end

  def current_hour_timetable
    timetable[current_hour.to_s]
  end

  def next_hour_timetable
    timetable[(current_hour + 1).to_s]
  end

  def current_hour_recent
    current_hour_timetable.select { |i| i > @current_datetime.minute }.first
  end

  def next_hour_bus
    DateTime.new(
      @current_datetime.year,
      @current_datetime.month,
      @current_datetime.day,
      (current_hour + 1),
      next_hour_timetable.first,
      0
    ).strftime("%H:%M")
  end

  def current_hour_bus
    DateTime.new(
      @current_datetime.year,
      @current_datetime.month,
      @current_datetime.day,
      current_hour,
      current_hour_recent,
      0
    ).strftime("%H:%M")
  end
end
