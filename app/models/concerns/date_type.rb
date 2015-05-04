module DateType
  extend ActiveSupport::Concern

  def date_type 
    holiday? ? :holiday : :weekday
  end

  def holiday?
    if HolidayJp.holiday?(@current_datetime.to_date) or @current_datetime.saturday? or @current_datetime.sunday?
      true
    else
      false
    end
  end
end
